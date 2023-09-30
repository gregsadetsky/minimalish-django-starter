# Minimalish Django Starter

## why

you are like me and want to _quickly_ start working on - and deploy - a minimalish Django project. wow you've literally come to the right place.

this django "**project template**" ((it's really confusing to use the word "template" because it's not a ... [template](https://docs.djangoproject.com/en/4.2/topics/templates/)...)) is based on / assumes you also want / is made out of the following:

- django 4.2 (not married to this version, it's just very modern and version 5 juuust came out so I'll hang around 4.2)
- python 3.10/.11 ish
- pip / venv / requirements.txt - tried and true, it works, etc.
- .env configuration files on developers' machines using `python-dotenv`
- os-level env vars on production
- dev/prod separation in the settings
- postgres via `psycopg2-binary`
- postgres database url set via env var
- custom user model (because you only get [one chance](https://docs.djangoproject.com/en/4.2/topics/auth/customizing/#changing-to-a-custom-user-model-mid-project))
- use of `os.environ[]` rather than the softer `os.getenv()` which by design silently fails. if an env var can't be found, that's a problem that needs addressing
- whitenoise

bonus round

- configuration to deploy all of this to render.com - they are like heroku used to be i.e. good

## what

## how

to initiate a new Django project using this starter kit template:

```bash
echo -n "what's your project name? "
read PROJECTNAME
python3 -m venv venv
source venv/bin/activate
pip install Django
django-admin startproject --template=https://github.com/gregsadetsky/minimalish-django-starter/archive/main.zip -n ".env.example" $PROJECTNAME .
mv starter $PROJECTNAME
git init
```

## other resources

- https://12factor.net/ - started it all
- https://github.com/cookiecutter/cookiecutter-django - exactly like this, "Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly" - but too much-y for my taste. it's great! I just wanted my own so I made this.
- https://github.com/jefftriplett/django-startproject - similar to this as well

## huh

this project was done during my time at the [Recurse Center](https://recurse.com/)
