echo -n "what's your project name? "
read PROJECTNAME
python3 -m venv venv
source venv/bin/activate
pip install Django
django-admin startproject --template=https://github.com/gregsadetsky/minimalish-django-starter/archive/main.zip -n ".env.example" $PROJECTNAME .
mv starter $PROJECTNAME
git init
