# Minimalish Django Starter Kit

## intro

Minimalish is a Django Project Template. It's an opiniated, deployment-ready, "good enough" starting point that includes most of everything you'd want to have in a Django project:

- dev / prod environment separation
- environment variables (per the classic [12factor](https://12factor.net/)) with fallback to `.env` (useful on dev)
- static file serving
- integration of the frontend bundler [Vite](https://vitejs.dev/) so that you can combine a TypeScript frontend with a Django backend. this is great for React projects, which most frontend projects are these days.
  - you also don't have to use Vite or write a TypeScript frontend -- the classic Django html templating still works fine.
- all of the necessary files to deploy your site using [disco](https://letsdisco.dev/)

## how to do it

Run these commands to create a new project:

```bash
curl -O https://raw.githubusercontent.com/gregsadetsky/minimalish-django-starter/main/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh
```

This will prompt you for a project name and set everything up automatically (venv, dependencies, migrations, secret key).

Then:

- activate the venv: `source venv/bin/activate`
- start the dev server: `python manage.py runserver`
- go to http://localhost:8000/ and do good work!

For the React frontend (optional):

- in another terminal, run `cd core/frontend && npm install && npm run dev`
- visit http://localhost:8000/react to see the vite/react page
- the frontend TypeScript code is under `core/frontend/src/`

to deploy using disco, create a new github repo with your new directory, and refer to the [disco Django+SQLite docs](https://docs.letsdisco.dev/deployment-guides/django).

## more technical info

Minimalish uses:

- [Django](https://www.djangoproject.com/) 5.2 LTS
- python 3.10/.11 ish
- pip / [venv](https://docs.python.org/3/library/venv.html) / requirements.txt
- .env configuration files on developers' machines using [`python-dotenv`](https://pypi.org/project/python-dotenv/)
- os-level env vars on production
- dev/prod [separation](starter/settings) in the settings
- integration of [Vite](https://vitejs.dev/) using [django-vite](https://github.com/MrBin99/django-vite)
- a custom user model[^1]
- use of `os.environ[]` rather than the softer `os.getenv()` which by design silently fails. if an env var can't be found, that's a problem that needs addressing
- [`whitenoise`](https://whitenoise.readthedocs.io/en/latest/) for static file serving
- `core` default/main app with a mini `/` function view & template file
- the necessary files to deploy this using [disco](https://letsdisco.dev/)

## more extra bonus things

- I suggest you setup & use [Black](https://github.com/psf/black) and [Pyright](https://github.com/microsoft/pyright) via text editor packages. Black should auto-format on save. TODO add black via pre-commit

## other resources

- https://12factor.net/ - started "it" all where "it" stands for good web app deployment practices
- https://github.com/cookiecutter/cookiecutter-django - exactly like this, "Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly" - but too much-y for my taste. it's great! I just wanted my own so I made this.
- https://github.com/jefftriplett/django-startproject - similar to this as well
- other ones: [djangox](https://github.com/wsvincent/djangox), [django-react-boilerplate](https://github.com/vintasoftware/django-react-boilerplate), [Django Material Kit](https://github.com/app-generator/django-material-kit)

## credit

this project was initially created during my time at the [Recurse Center](https://recurse.com/). thanks to [Rob Simmons](https://github.com/robsimmons) for the contributions!

[^1]: because you only get [one chance](https://docs.djangoproject.com/en/4.2/topics/auth/customizing/#changing-to-a-custom-user-model-mid-project)
