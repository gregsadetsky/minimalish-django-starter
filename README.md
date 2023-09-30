to start from this project starter kit template:

```bash
git init
echo -n "what's your project name? "
read PROJECTNAME
python3 -m venv venv
source venv/bin/activate
pip install Django
django-admin startproject --template=https://github.com/gregsadetsky/minimalish-django-starter/archive/main.zip --extension=py $PROJECTNAME .
# this is where you "set" the project name, replacing the default/template "starter" name
mv starter $PROJECTNAME
git init
```
