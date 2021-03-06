import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(here, 'README.txt')) as f:
    README = f.read()
with open(os.path.join(here, 'CHANGES.txt')) as f:
    CHANGES = f.read()

requires = [
    'pyramid',
    'pyramid_chameleon',
    'pyramid_debugtoolbar',
    'pyramid_tm',
    'SQLAlchemy',
    'transaction',
    'zope.sqlalchemy',
    'waitress',
    'mysql-python',
    'pyramid_handlers',
    'WebTest',
    'nose',
    'webhelpers'
    ]

setup(name='einvoices',
      version='0.0',
      description='einvoices',
      long_description=README + '\n\n' + CHANGES,
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pyramid",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='manglesoft',
      author_email='admin@manglesoft.com',
      url='',
      keywords='web wsgi bfg pylons pyramid',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      test_suite='einvoices',
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = einvoices:main
      [console_scripts]
      initialize_einvoices_db = einvoices.scripts.initializedb:main
      """,
      )
