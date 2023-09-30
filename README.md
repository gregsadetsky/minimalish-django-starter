to start from this project starter kit template:

```bash
python3 -m venv venv
source venv/bin/activate
pip install Django
# weirdly enough, startproject requires a name (here, "banana")
# but that name won't appear anywhere (grep for banana! it's not there!)
django-admin startproject --template=https://github.com/gregsadetsky/minimalish-django-starter/archive/main.zip banana .
# this is where you "set" the project name, replacing the default/template "starter" name
mv starter PROJECTNAME
```
