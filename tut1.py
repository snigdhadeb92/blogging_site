from flask import Flask, render_template, request,session, redirect
from flask.globals import session
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail, Message

import json
import os
import math
from datetime import datetime
from flask_mail import Mail




with open('config.json', 'r') as c:
    params = json.load(c) ['params']

local_server=True
app = Flask(__name__, template_folder='template')
app.secret_key = 'supersecretkey'

app.config['upload_folder']= params['upload_location']

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT']=465
app.config['MAIL_USERNAME']=params['gmail_user']
app.config['MAIL_PASSWORD']=params['gmail_password']
app.config['MAIL_USE_TLS']=False
app.config['MAIL_USE_SSL']=True
mail=Mail(app)

if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']



db = SQLAlchemy(app)

class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    email = db.Column(db.String(50), unique=True, nullable=False)
    phone = db.Column(db.String(12), unique=True, nullable=False)
    msg = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(12),  nullable=True)

class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), unique=False, nullable=False)
    slug = db.Column(db.String(50), unique=True, nullable=False)
    content = db.Column(db.String(2000), unique=False, nullable=False)
    img_file = db.Column(db.String(12),  nullable=True)
    date = db.Column(db.String(12),  nullable=True)


@app.route('/')
def home():
    posts = Post.query.filter_by().all()

    last=math.ceil(len(posts)/int(params['no_of_post']))
    #[0:params['no_of_post']]

    page=request.args.get('page')

    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts= posts[(page-1)*int(params['no_of_post']):(page-1)*int(params['no_of_post'])+int(params['no_of_post'])]

    if(page==1):
        previous='#'
        next= "/?page="+str(page+1)
    elif(page==last):
        previous="/?page="+str(page-1)
        next='#'
    else:
        previous="/?page="+str(page-1)
        next= "/?page="+str(page+1)

    
    
    return render_template('index.html', params=params, posts=posts, previous=previous, next=next)

@app.route('/about')
def about():
    return render_template('about.html', params=params)

#need to built
@app.route('/contact', methods=['GET','POST'])
def contact():
    if(request.method=='POST'):
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('message')
        entry = Contact(name=name, email=email, phone=phone, msg=message, date=datetime.now())

        db.session.add(entry)
        db.session.commit()

        msg = Message(subject="A mail by: "+ name,sender=email,recipients=[params['gmail_user']])
        msg.html="<h1>Below messege is importent</h1> <br/>"+message +"</br> Phone No:"+phone

        mail.send(msg)

    return render_template('contact.html', params=params)

@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Post.query.filter(Post.slug==post_slug).first()
    return render_template('post.html', params=params, post=post)

@app.route('/login', methods=['GET','POST'])
def login_page():
    if ('user' in session and session['user']==params['admin_user']):
        posts = Post.query.filter_by().all()
        return render_template('adminpanel.html', params=params,posts=posts)

    if request.method=='POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if (username==params['admin_user'] and password==params['admin_password']):
            #set this session variable
            session['user'] = username
            posts = Post.query.filter_by().all()
            return render_template('adminpanel.html', params=params, posts=posts)
    else:
        return render_template('login.html', params=params)

@app.route('/upload', methods=['GET','POST'])
def upload_post():
    if(request.method=='POST'):
        title=request.form.get('title')
        slug=request.form.get('slug')
        content=request.form.get('content')
        #img_file=request.form.get('img_file')
        img_file=request.files['img_file']
        img_file.save(os.path.join(app.config['upload_folder'], secure_filename(img_file.filename)))
        url=img_file.filename
        post=Post(title=title, slug=slug, content=content, img_file=url, date=datetime.now())
        db.session.add(post)
        db.session.commit()

    return render_template('upload.html',params=params)

@app.route('/edit/<string:id>', methods=['GET','POST'])
def edit(id):
    post = Post.query.filter(Post.id==id).first()
    if(request.method=='POST'):
        title=request.form.get('title')
        slug=request.form.get('slug')
        content=request.form.get('content')
        img_file=request.form.get('img_file')


        post.title = title
        post.slug = slug
        post.content = content
        post.img_file = img_file
        post.date = datetime.now()

        db.session.commit()
   

    
    return render_template('edit.html', params=params, post=post)

@app.route('/logout', methods=['GET','POST'])
def logout():
    session.pop('user')
    return redirect('/login')

@app.route('/delete/<string:id>', methods=['GET','POST'])
def delete(id):
    if ('user' in session and session['user']==params['admin_user']):
        post=Post.query.filter(Post.id==id).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/login')
    
     
    

app.run(debug=True)