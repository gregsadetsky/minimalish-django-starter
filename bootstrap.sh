#!/bin/sh
set -e

# Minimalish Django Starter - Bootstrap Script
# Usage: curl -s https://raw.githubusercontent.com/gregsadetsky/minimalish-django-starter/main/bootstrap.sh | sh

echo "Minimalish Django Starter"
echo "========================="
echo ""

# Get project name
printf "Project name (lowercase, no spaces/hyphens): "
read PROJECTNAME

# Validate project name
if [ -z "$PROJECTNAME" ]; then
    echo "Error: Project name cannot be empty"
    exit 1
fi

if echo "$PROJECTNAME" | grep -q '[^a-z0-9_]'; then
    echo "Error: Project name should only contain lowercase letters, numbers, and underscores"
    exit 1
fi

if [ -d "$PROJECTNAME" ]; then
    echo "Error: Directory '$PROJECTNAME' already exists"
    exit 1
fi

echo ""
echo "Creating project '$PROJECTNAME'..."
echo ""

# Create project directory
mkdir "$PROJECTNAME"
cd "$PROJECTNAME"

# Create and activate virtual environment
echo "-> Creating virtual environment..."
python3 -m venv venv
. venv/bin/activate

# Install Django
echo "-> Installing Django..."
pip install Django==5.2 --quiet

# Run startproject with template
echo "-> Running django-admin startproject..."
django-admin startproject \
    --template=https://github.com/gregsadetsky/minimalish-django-starter/archive/main.zip \
    -n .env.example -n README.starter.md -n serve.sh \
    "$PROJECTNAME" .

# Install requirements
echo "-> Installing requirements..."
pip install -r requirements.txt --quiet

# Rename starter to project name
mv starter "$PROJECTNAME"

# Setup files
mv README.starter.md README.md
cp .env.example .env

# Create static directory
mkdir -p core/frontend/static

# Generate a secret key and set it in .env
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_urlsafe(50))")
if [ "$(uname)" = "Darwin" ]; then
    sed -i '' "s/DJANGO_SECRET_KEY='\.\.\.\.\.\.\.\.\.\.\.'/DJANGO_SECRET_KEY='$SECRET_KEY'/" .env
else
    sed -i "s/DJANGO_SECRET_KEY='\.\.\.\.\.\.\.\.\.\.\.'/DJANGO_SECRET_KEY='$SECRET_KEY'/" .env
fi

# Run migrations
echo "-> Running migrations..."
python manage.py migrate --verbosity 0

# Initialize git
git init --quiet

echo ""
echo "Done! Your project '$PROJECTNAME' is ready."
echo ""
echo "Next steps:"
echo "  cd $PROJECTNAME"
echo "  source venv/bin/activate"
echo "  python manage.py runserver"
echo ""
echo "For the React frontend (optional):"
echo "  cd core/frontend && npm install && npm run dev"
echo ""
echo "Then visit http://localhost:8000/"
