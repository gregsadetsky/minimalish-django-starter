# Minimalish Django Starter

### why

you are like me and want to _quickly_ start working on - and deploy! - a minimalish Django project. wow you've literally come to the right place.

## let's do it immediately

to initiate a new Django project using this starter kit template, copy-paste & run all of the code below:

```bash
echo -n "what's your project name (keep it short, lowercase, etc.)? "
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

- create a new postgres database locally (on mac and need help? see the footnote[^0])
- duplicate `.env.example` to `.env` and fill it out
- run `python manage.py migrate`
- start the server with `python manage.py runserver`
- do good work

finally:

- create a new repo (on github -- [go here](https://github.com/new))
- git add/commit/push all of your code to this new repo
- go to [render.com](https://render.com/), go to "[Blueprints](https://dashboard.render.com/blueprints)" and click the "New Blueprint Instance" button. assuming that your github account is connected to your render account, connect your new repo with the new blueprint
  - set the `ALLOWED_HOSTS` value to the domain name you want to use and/or the `.onrender.com` sub-domain (see below). comma separate domains if you have multiple.
  - it can be confusing to do the previous step because you won't know which .onrender.com domain you'll be given when setting up the blueprint... uh... I guess you can write some domain in ALLOWED_HOSTS like example.com, do the render blueprint deployment, then see which domain you actually got, and then edit the ALLOWED_HOSTS value to the right .onrender.com domain... sorry, this is not perfect! TODO make it better.
- ok phew, you should be live!!!
- delete the contents of this readme and start anew; you could even add a little [powered by minimalish django starter](https://github.com/gregsadetsky/minimalish-django-starter) note at the bottom? but don't fret. TODO make the default readme not be the minimalish readme.

## I want more technical information

"minimalish" (i.e. this!) is a django "**project template**"[^1] aka boilerplate that is based on / assumes you also want / is made out of the following:

- [django](https://www.djangoproject.com/) 4.2.5[^2]
- python 3.10/.11 ish
- pip / [venv](https://docs.python.org/3/library/venv.html) / requirements.txt - tried and true, it works, etc.
- .env configuration files on developers' machines using [`python-dotenv`](https://pypi.org/project/python-dotenv/)
- os-level env vars on production
- dev/prod [separation](starter/settings) in the settings
- postgres via [`psycopg2-binary`](https://pypi.org/project/psycopg2-binary/)
- postgres database url set via env var thanks to [`dj-database-url`](https://pypi.org/project/dj-database-url/)
- custom user model[^3]
- use of `os.environ[]` rather than the softer `os.getenv()` which by design silently fails. if an env var can't be found, that's a problem that needs addressing
- [`whitenoise`](https://whitenoise.readthedocs.io/en/latest/) for static file serving
- `core` default/main app with a mini `/` function view & template file

bonus round

- [configuration](render.yaml) & [script](bin/build.sh) to deploy, build & run all of this on render.com!! - they are like heroku used to be i.e. good (sorry [not sorry](https://news.ycombinator.com/item?id=34598563))

## more extra bonus things

- I suggest you setup & use [Black](https://github.com/psf/black) and [Pyright](https://github.com/microsoft/pyright) via text editor packages. Black should auto-format on save. TODO add black to this thing using pre-commit

## other resources

- https://12factor.net/ - started "it" all where "it" stands for good web app deployment practices
- https://github.com/cookiecutter/cookiecutter-django - exactly like this, "Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly" - but too much-y for my taste. it's great! I just wanted my own so I made this.
- https://github.com/jefftriplett/django-startproject - similar to this as well
- other ones: [djangox](https://github.com/wsvincent/djangox), [django-react-boilerplate](https://github.com/vintasoftware/django-react-boilerplate), [Django Material Kit](https://github.com/app-generator/django-material-kit)

## huh!

this project was done during my time at the [Recurse Center](https://recurse.com/)

[^0]: if you're on mac, I suggest [Postgres.app](https://postgresapp.com/) to run postgres locally and [Postico](https://eggerapps.at/postico2/) to view & change stuff in the database
[^1]: it's really confusing to use the word "template" because it's not a ... [template](https://docs.djangoproject.com/en/4.2/topics/templates/)...
[^2]: not married to this version, it's just very modern and version 5 juuust came out so I'll hang around 4.2
[^3]: because you only get [one chance](https://docs.djangoproject.com/en/4.2/topics/auth/customizing/#changing-to-a-custom-user-model-mid-project)
