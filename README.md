# Minimalish Django Starter

### why

you are like me and want to _quickly_ start working on - and deploy! - a minimalish Django project. wow you've literally come to the right place.

## ok

this django "**project template**"[^1] aka boilerplate is based on / assumes you also want / is made out of the following:

- django 4.2.5[^2]
- python 3.10/.11 ish
- pip / venv / requirements.txt - tried and true, it works, etc.
- .env configuration files on developers' machines using `python-dotenv`
- os-level env vars on production
- dev/prod separation in the settings
- postgres via `psycopg2-binary`
- postgres database url set via env var thanks to `dj-database-url`
- custom user model[^3]
- use of `os.environ[]` rather than the softer `os.getenv()` which by design silently fails. if an env var can't be found, that's a problem that needs addressing
- whitenoise
- `core` default/main app with a mini `/` function view & template file

bonus round

- configuration & script files to deploy all of this to render.com!! - they are like heroku used to be i.e. good

## how

to initiate a new Django project using this starter kit template (copy-paste all of it):

```bash
echo -n "what's your project name? "
read PROJECTNAME
python3 -m venv venv
source venv/bin/activate
pip install Django==4.2.5
django-admin startproject --template=https://github.com/gregsadetsky/minimalish-django-starter/archive/main.zip -n ".env.example" -n "render.yaml" $PROJECTNAME .
pip install -r requirements.txt
mv starter $PROJECTNAME
git init
```

then:

- duplicate `.env.example` to `.env` and fill it out
- create the appropriate postgres database locally
- run `python manage.py migrate`
- start the server with `python manage.py runserver`
- do good work

finally:

- git add/commit/push to a new repo
- go to render.com, create a new "blueprint instance" and point it to your repo
  - set the `ALLOWED_HOSTS` env var to the domain name you want to use and/or the `.onrender.com` sub-domain (comma separate if you have multiple)
- you should be live!!

## misc/extra bonus

- use Black and Pyright via text editor packages. Black should auto-format on save.

## other resources

- https://12factor.net/ - started it all
- https://github.com/cookiecutter/cookiecutter-django - exactly like this, "Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly" - but too much-y for my taste. it's great! I just wanted my own so I made this.
- https://github.com/jefftriplett/django-startproject - similar to this as well
- other ones: [djangox](https://github.com/wsvincent/djangox), [django-react-boilerplate](https://github.com/vintasoftware/django-react-boilerplate), [Django Material Kit](https://github.com/app-generator/django-material-kit)

## huh

this project was done during my time at the [Recurse Center](https://recurse.com/)

[^1]: it's really confusing to use the word "template" because it's not a ... [template](https://docs.djangoproject.com/en/4.2/topics/templates/)...
[^2]: not married to this version, it's just very modern and version 5 juuust came out so I'll hang around 4.2
[^3]: because you only get [one chance](https://docs.djangoproject.com/en/4.2/topics/auth/customizing/#changing-to-a-custom-user-model-mid-project)
