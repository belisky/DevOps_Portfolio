# Gutendex Installation Guide
This installation guide is a modified version of [the original Gutendex Installation Guide](https://github.com/garethbjohnson/gutendex/wiki/Installation-Guide), adapted to be easier when dockerizing for the _develeap_ DevOps bootcamp exam 1.

## 1. Prerequisites
The following version ranges should be compatible:

- Postgres 9.5-14
- Python 3.6-3.9

## 2. Make the Database
Using an instance of Postgres DB:

- Setup a database named `gutendex` (you can replace `gutendex` with something else if you update the `DATABASE_NAME` environment variable accordingly, described below).
- Setup a user named `gutendex` for the database (you can also replace `gutendex` with another user name, updating the `DATABASE_USER` environment variable below).
- Make sure the database user has full access permissions to the database (`GRANT ALL PRIVILEGES ON DATABASE gutendex TO gutendex;`).

## 3. Install Python Packages
Python packages required by Gutendex are listed with their version numbers in `requirements.txt`.
We recommend that you install these with `pip`.

## 4. Make Environment Variables
A number of environment variables are used by Gutendex; an example/tempalte can be found in `gutendex/.env.template`.

We recommend that you copy this file to a new file called `.env` and edit the values after the `=` sign on each line with the proper data. The Django project will automatically read this file when the server starts.

Descriptions of each required variable are below.

- `ADMIN_EMAILS`
  This is a list of email addresses of the project administrators in `ADMIN_NAMES`. Addresses should be separated by commas and be in the same quantity and order as the names in `ADMIN_NAMES`.
- `ADMIN_NAMES`
  This is a list of names of project administrators that will be emailed with catalog download logs and various Django messages, such as security warnings. Names should be separated with commas.
- `ALLOWED_HOSTS`
  This is a list of domains and IP addresses on which you allow Gutendex to be served. Domains should be separated by commas. To allow any subdomain of a domain, add a `.` before the domain (e.g. `.gutendex.com` allows `gutendex.com`, `api.gutendex.com`, etc.). I recommend including `127.0.0.1` and/or `localhost` for development and testing on your local machine.
- `DATABASE_HOST`
  This is the domain or IP address on which your Postgres database runs. It is typically `127.0.0.1` for local databases.
- `DATABASE_NAME`
  This is the name of the Postgres database that you used. (Instructions for creating this database are above.) I recommend `gutendex`.
- `DATABASE_PASSWORD`
  This is the password for `DATABASE_USER`.
- `DATABASE_PORT`
  This is the port number on which the Gutendex database runs. This will typically be `5432`.
- `DATABASE_USER`
  This is the name of a database user with all privileges for the Gutendex database. I recommend `gutendex`.
- `DEBUG`
  This is a Django setting for displaying useful debugging information. `true` will show this information in API responses when errors occur during development. It is important for security that you set this to `false` before serving Gutendex on a public address.
- `EMAIL_HOST`
  This is the address of the SMTP server that Gutendex will try to use when sending email. (For Mailgun, this is `smtp.mailgun.org`.)
- `EMAIL_HOST_ADDRESS`
  This is the email address where Gutendex email will appear to come from. (For Mailgun, this can probably be any email address.)
- `EMAIL_HOST_PASSWORD`
  This is the password for the the below `EMAIL_HOST_USER`. (For Mailgun, this is the 'Default Password' value in your Domain Information.)
- `EMAIL_HOST_USER`
  This is the user name that Gutendex will use to send email from the SMTP server in `EMAIL_HOST`. (For Mailgun, this is the 'Default SMTP Login' value in your Domain Information.)
- `MANAGER_EMAILS`
  This is a list of email addresses of the website managers in `MANAGER_NAMES`. Addresses should be separated by commas and be in the same quantity and order as the names in `MANAGER_NAMES`.
- `MANAGER_NAMES`
  This is a list of names of website managers that can be emailed with various Django messages. Names should be separated with commas.
- `MEDIA_ROOT`
  This is the path to a server directory where any API user media (currently nothing) can be stored.
- `SECRET_KEY`
  This is a password that Django uses for security reasons. It should be a long string of characters that should be kept secret. You do not need to copy or remember it anywhere.
- `STATIC_ROOT`
  This is the path to a server directory where website assets, such as CSS styles for HTML pages, are stored.

## 5. Migrate the Database
Set up the database for storing the catalog data:

```
./manage.py migrate
```

## 6. Populate the Database
Enter the Project Gutenberg catalog data into the Gutendex database. This takes a long time (around several minutes):

```
./manage.py updatecatalog
```

This downloads a file archive of Project Gutenberg's catalog data and decompresses the files into a new directory, `catalog_files`. It places the contained files in `catalog_files/rdf`, and it stores a log in `catalog_files/log` and emails it to the administrators in the environment variables mentioned above.

If your database already contains catalog data, the above command will update it with any new or updated data from Project Gutenberg. I recommend that you schedule this command to run on your server daily – for example, using `cron` on Unix-like machines – to keep your database up-to-date.

## 7. Collect Static Files
To show styled HTML pages (i.e. the home page and error pages), you must put the necessary stylesheets into a static-file directory:

```
./manage.py collectstatic
```

## 8. Run the Server
Now you can serve your Django project. You can run this with the following command:

```
./manage.py runserver ${BIND_HOST}:${BIND_PORT}
```

You can set the listening host and port with `${BIND_HOST}` and `${BIND_PORT}` respectively. More info available in [Django's documentation](https://docs.djangoproject.com/en/4.1/ref/django-admin/#runserver).

### Serving Publicly
In a production environment, one should use Nginx or Apache to serve:
- static files (located in `static/` directory),
- `robots.txt` (also located in `static/` directory),
- any future user media, and
- the web API itself (the application iteslef).
