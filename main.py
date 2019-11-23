from flask import Flask, render_template, flash, request
from wtforms import Form, TextField, TextAreaField, validators, StringField, SubmitField
from pyswip import Prolog
import os
import time

# App config.
DEBUG = True
app = Flask(__name__)
app.config.from_object(__name__)
app.config['SECRET_KEY'] = '7d441f27d441f27567d441f2b6176a'



class ReusableForm(Form):
    
    name = TextField('Name:', validators=[validators.required()])
    
    @app.route("/", methods=['GET', 'POST'])
    def hello():
        form = ReusableForm(request.form)
        if request.method == 'POST':

            name=request.form['name']
            fiebre = request.form.get('fiebre') == 'on'
            nausea = request.form.get('nausea') == 'on'
            diarrea = request.form.get('diarrea') == 'on'
            headache = request.form.get('headache') == 'on'
            print(fiebre, nausea, diarrea, headache)
            os.system('swipl -q -t "program" console.pl')
        if form.validate():
            f = open("file.txt", "r")
            disease = f.read()
            print(disease)
            flash('Hola ' + name + ', por tus sintomas podemos deducir que tienes '+ disease)
        else:
            flash('Error: Debes ingresar tu nombre. ')
    
        return render_template('hello.html', form=form)

if __name__ == "__main__":
    app.run()
