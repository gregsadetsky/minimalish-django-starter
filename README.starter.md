# Django project {{ project_name}}

Hi! This is the Django source for {{ project_name}}.

## TODO

If you followed the [Minimalish Django starter](https://github.com/gregsadetsky/minimalish-django-starter) instructions, you still have a couple of steps to go to make a thing that lives on the internet.

next:

- fill out the values in the `.env` file
- run `python manage.py migrate`
- start the server with `python manage.py runserver`
- do good work!

to deploy using disco:

- create a new repo (on github -- [go here](https://github.com/new))
- git add/commit/push all of your code to this new repo
- refer to the [disco Django+SQLite docs](https://docs.letsdisco.dev/deployment-guides/django)

# Development basics

## Getting started the first time

To get started, navigate to the directory where this code lives. If you're downloading this code fresh, you'll need to run these commands:

```
python3 -m venv venv
pip install -r requirements.txt
```

## Getting started every time

If you've done that before, or if you just did the [minimalish-django-starter setup](https://github.com/gregsadetsky/minimalish-django-starter), you can skip those two lines and just run

```
source venv/bin/activate
python manage.py runserver
```

If you get hollered at to run some other command like `python manage.py migrate` hit Ctrl-C to stop the server, do that and then run `python manage.py runserver` again, no worries.

-----

[powered by Minimalish](https://github.com/gregsadetsky/minimalish-django-starter) 
