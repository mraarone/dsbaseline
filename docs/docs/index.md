# Data Science Project Template (DSBaseline)

DSBaseline is a project template that is easy to use and customize. The main template project uses new GitHub features to make the creation and initialization of the project a no-code user experience. Once your project is created from the template, you have the option to also copy all of the branches and merge in feature branches. These branches are being pulled together so that they will be modular. You'll be able to include example implementations like for wrapping your code into a microservice for inference, using a directed acyclic graph automation system to manage data ETL/ELT/EtLT tasks, data version control, rapid development advanced user interfaces, and more are being built from examples out in the wild. Once you merge in feature branches, go to "Actions" and click the "Finalize Project" workflow to clean up the undesired feature branches and remaining scaffolding artifacts.

Use this project for everything.

Please CONTRIBUTE! This project is a work in progress and needs your help to make it better. If you don't see something that you'd like integrated, please create a new [issue](../../issues/new) or fork the project and create a new [pull request](../../pulls) to include a new branch for your feature contribution.

## Why use DSBaseline?

Many new data science and machine learning engineers are not familiar with areas required to further along their work. These areas usually come with cross-skilled experiences over time, and are often not taught in University. Organizations early in AI/ML adoption also haven't yet developed an organizational data strategy or began connecting their data science groups with business analyst, data engineering, information technology, networking, or executive leadership consumers. These situations often lead to data science projects not making it to production, or a low production rate.

The goal with this data science baseline project template is to give base resources to data scientists and maturing organizations. Let this project be an example of how DataOps, DevSecOps, and MLOps can be employed end-to-end in a project from a cloud native and as-code perspective.

This project provides example of security, system administration, linux consoles, networking, containerization, orchestration, software engineering best practices, online data analysis, microservices, CI/CD, project organization, and more. These are all important areas that are necessary to build a successful data science project. DSBaseline is a collection of tools and best practices that I have found useful in my own data science projects over the years. I hope you find it useful as well.

Much thanks to Claudio Jolowicz for his [Hypermodern Python](https://github.com/cjolowicz/hypermodern-python), and Driven Data for their outstanding [Cookiecutter-Datascience-Project]](<https://github.com/drivendata/cookiecutter-data-science/>). [Stefan Buck](https://github.com/stefanbuck) also had great resource using new GitHub features that made this project possible. Head over to these folks' repos for more information. Thank you greatly for your open source contributions!

## Main Benefits

- Rapid no-code customized project generation
- An end-to-end project for the entire data science lifecycle
- Totally as-code implementations
- A lightweight browser-based X-windows environment using NoVNC and Fluxbox
- Fully featured development environment as-a-service with zsh and kubernetes installed on a single container to keep costs low
- Feature branches provide example implementations of standard data science tools
- Flexible project structure for doing and sharing data science work.

## Why use this project structure?

> Ultimately, data science code quality is about correctness and reproducibility.

When we think about data analysis, we often think just about the resulting reports, insights, or visualizations. While these end products are generally the main event, it's easy to focus on making the products _look nice_ and ignore the _quality of the code that generates them_. Because these end products are created programmatically, **code quality is still important**!

### Other people will thank you

A well-defined, standard project structure means that a newcomer can begin to understand an analysis without digging in to extensive documentation. It also means that they don't necessarily have to read 100% of the code before knowing where to look for very specific things.

Well organized code tends to be self-documenting in that the organization itself provides context for your code without much overhead. People will thank you for this because they can:

- Collaborate more easily with you on this analysis
- Learn from your analysis about the process and the domain
- Feel confident in the conclusions at which the analysis arrives

Ideally, that's how it should be when a colleague opens up your data science project.

### Requirements

- GitHub account
- Python 3.8.10+
- Poetry 1.2.1+

### Starting a new project

Starting a new project is as easy creating a new issue with your project customized information like Author Name, Project Name, License type, etc. GitHub CI will automatically replace the tokens throughout the project with your customizations and remove the scaffolding artifacts. You can then merge in the feature branches that you want to use in your project and kick off the "Finalize Project" workflow to clean up the remaining scaffolding artifacts. It's that easy!

## Directory structure

```nohighlight
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── pyproject.toml     <- The poetry requirements file for reproducing the analysis environment
│                         Use `poetry install` to install the version managed dependencies.
│                         Use `poetry shell` gives you an environment to work in.
│                         Alternatively, use `make requirements` or `make shell`.
│
├── setup.py           <- Make this project pip installable with `pip install -e`
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.readthedocs.io
```

## Opinions

This project may appear opinionated, but it's not really. Enough has been built into the project to get you started, but it's not so much that you can't change it. The project is designed to be flexible and easy to change. The project is designed to be a starting point for your own project, not a framework that you have to use. There may be multiple linters or multiple ways to implement CI/CD and security. That's okay, it's so you have options to choose from! Simply remove what you do not want, or add in what you need. For instance, pre-install git hooks using ```pip install pre-install``` and ```pre-install install``` if you want to implement the ```pre-install-hooks.yml``` in the root of the project. You can use Nox to run a sequential run of the preliminary DevSecOps pipeline. This is an example of how you can implement these tools in your project. Your security requirements will undoubtedly be different. This project uses all Free and Open Source Software to get your started as long as you make your project Open Source (Public).

At the time of this writing, GitHub Codespaces cost $0.18 USD / hour for the 2 core version. But the ```devcontainer.json``` is currently configured to use 8GB of RAM, which is a 4 core system and $0.36 USD / hour. It's using this so it can run Docker-in-Docker, Kubernetes, and an X-Windows system for web testing and a desktop. All of this runs within the container, so it only costs exactly what this one Codespace costs per hour. The Kubernetes environment is built using Minikube. You can use helm to install helm charts in a single console line to have MySQL, PostgreSQL, SQLite, Redis, dbt, Feast, Spark, Kafka, Flink, Zeppelin, or etc. running in your single Codespace for exploration and testing.

If you mess something up, blow away the Codespace and start a new one. No harm no fowl, just make sure you commit and push your code changes you want to keep.

### A Reasonable Data Science Workflow for Rapid Iteration

```mermaid
flowchart LR
    A[Data: Generation] --> B(Data: Ingest) --> C(Data: Transform) --> D(Data: Load) --> E(Data: Explore) --> F(Data: Explore) --> G(DS:Model)
    G --> H(DS: Train/Test/Validate) --> I(DS: Report)
    H -->|Move Code to Source Code Package| O(SE: Integrate) & P(DS/SE: Microservice) --> Q(IT: Deploy)
    B --> D
    D --> C
    D --> J[Data: Store]
    J --> K[Data: Catalog]
    J --> L[Data: Version]
    J --> M[Data: Mart]
    J --> N[Data: Feature Store]
```

```mermaid
flowchart LR
    A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
```

1. Follow a naming convention that shows the owner and the order the analysis was done in. We use the format `<step>-<ghuser>-<description>.ipynb` (e.g., `0.3-bull-visualize-distributions.ipynb`).

2. Refactor the good parts. Don't write code to do the same task in multiple notebooks. If it's a data preprocessing task, put it in the data pipeline at `src/data/make_dataset.py` and load data from `data/interim`. If it's useful utility code, refactor it to `src`.

Now by default we turn the project into a Python package (see the `setup.py` file). You can import your code and use it in notebooks with a cell like the following:

```python
# OPTIONAL: Load the "autoreload" extension so that code can change
%load_ext autoreload

# OPTIONAL: always reload modules so that as you change code in src, it gets loaded
%autoreload 2

from src.data import make_dataset
```

### Analysis is a directed acyclic graph

([DAG](https://en.wikipedia.org/wiki/Directed_acyclic_graph)) -- Often in an analysis you have long-running steps that preprocess data or train models. If these steps have been run already (and you have stored the output somewhere like the `data/interim` directory), you don't want to wait to rerun them every time. We prefer [`make`](https://www.gnu.org/software/make/) for managing steps that depend on each other, especially the long-running ones. Make is a common tool on Unix-based platforms (and is available for Windows). Following the [`make` documentation](https://www.gnu.org/software/make/), [Makefile conventions](https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html#Makefile-Conventions), and [portability guide](http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Portable-Make.html#Portable-Make) will help ensure your Makefiles work effectively across systems. Here are [some](http://zmjones.com/make/) [examples](http://blog.kaggle.com/2012/10/15/make-for-data-scientists/) to [get started](https://web.archive.org/web/20150206054212/http://www.bioinformaticszen.com/post/decomplected-workflows-makefiles/). A number of data folks use `make` as their tool of choice, including [Mike Bostock](https://bost.ocks.org/mike/make/).

There are other tools for managing DAGs that are written in Python instead of a DSL (e.g., [Paver](http://paver.github.io/paver/#), [Luigi](http://luigi.readthedocs.org/en/stable/index.html), [Airflow](https://airflow.apache.org/index.html), [Snakemake](https://snakemake.readthedocs.io/en/stable/), [Ruffus](http://www.ruffus.org.uk/), or [Joblib](https://pythonhosted.org/joblib/memory.html)). Feel free to use these if they are more appropriate for your analysis.

### Build from the environment up

The first step in reproducing an analysis is always reproducing the computational environment it was run in. You need the same tools, the same libraries, and the same versions to make everything play nicely together.

One effective approach to this is use [virtualenv](https://virtualenv.pypa.io/en/latest/) (we recommend [virtualenvwrapper](https://virtualenvwrapper.readthedocs.org/en/latest/) for managing virtualenvs). By listing all of your requirements in the repository (we include a `requirements.txt` file) you can easily track the packages needed to recreate the analysis. Here is a good workflow:

1. Run `mkvirtualenv` when creating a new project
2. `pip install` the packages that your analysis needs
3. Run `pip freeze > requirements.txt` to pin the exact package versions used to recreate the analysis
4. If you find you need to install another package, run `pip freeze > requirements.txt` again and commit the changes to version control.

If you have more complex requirements for recreating your environment, consider a virtual machine based approach such as [Docker](https://www.docker.com/) or [Vagrant](https://www.vagrantup.com/). Both of these tools use text-based formats (Dockerfile and Vagrantfile respectively) you can easily add to source control to describe how to create a virtual machine with the requirements you need.

### Keep secrets and configuration out of version control

You _really_ don't want to leak your AWS secret key or Postgres username and password on Github. Enough said — see the [Twelve Factor App](http://12factor.net/config) principles on this point. Here's one way to do this:

#### Store your secrets and config variables in a special file

Create a `.env` file in the project root folder. Thanks to the `.gitignore`, this file should never get committed into the version control repository. Here's an example:

```nohighlight
# example .env file
DATABASE_URL=postgres://username:password@localhost:5432/dbname
AWS_ACCESS_KEY=myaccesskey
AWS_SECRET_ACCESS_KEY=mysecretkey
OTHER_VARIABLE=something
```

#### Use a package to load these variables automatically

If you look at the stub script in `src/data/make_dataset.py`, it uses a package called [python-dotenv](https://github.com/theskumar/python-dotenv) to load up all the entries in this file as environment variables so they are accessible with `os.environ.get`. Here's an example snippet adapted from the `python-dotenv` documentation:

```python
# src/data/dotenv_example.py
import os
from dotenv import load_dotenv, find_dotenv

# find .env automagically by walking up directories until it's found
dotenv_path = find_dotenv()

# load up the entries as environment variables
load_dotenv(dotenv_path)

database_url = os.environ.get("DATABASE_URL")
other_variable = os.environ.get("OTHER_VARIABLE")
```

#### AWS CLI configuration

When using Amazon S3 to store data, a simple method of managing AWS access is to set your access keys to environment variables. However, managing multiple sets of keys on a single machine (e.g. when working on multiple projects) it is best to use a [credentials file](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html), typically located in `~/.aws/credentials`. A typical file might look like:

```toml
[default]
aws_access_key_id=myaccesskey
aws_secret_access_key=mysecretkey

[another_project]
aws_access_key_id=myprojectaccesskey
aws_secret_access_key=myprojectsecretkey
```

You can add the profile name when initializing a project; assuming no applicable environment variables are set, the profile credentials will be used by default.

### Be conservative in changing the default folder structure

To keep this structure broadly applicable for many different kinds of projects, we think the best approach is to be liberal in changing the folders around for _your_ project, but be conservative in changing the default structure for _all_ projects.

We've created a ```folder-layout``` label specifically for issues proposing to add, subtract, rename, or move folders around. More generally, we've also created a ```needs-discussion``` label for issues that should have some careful discussion and broad support before being implemented.

## Contributing

The Cookiecutter Data Science project is opinionated, but not afraid to be wrong. Best practices change, tools evolve, and lessons are learned. **The goal of this project is to make it easier to start, structure, and share an analysis.** [Pull requests](https://github.com/huntsville-open-source-ai/dsbaseline/pulls) and [filing issues](https://github.com/huntsville-open-source-ai/dsbaseline/issues) is encouraged. We'd love to hear what works for you, and what doesn't.

If you use the Cookiecutter Data Science project, link back to this page or [let us know](mailto:huntsvilleopensourceai@gmail.com)!

## Links to related projects and references

Project structure and reproducibility is talked about more in the R research community. Here are some projects and blog posts if you're working in R that may help you out.

- [Project Template](http://projecttemplate.net/index.html) - An R data analysis template
- "[Designing projects](http://nicercode.github.io/blog/2013-04-05-projects/)" on Nice R Code
- "[My research workflow](http://www.carlboettiger.info/2012/05/06/research-workflow.html)" on Carlboettiger.info
- "[A Quick Guide to Organizing Computational Biology Projects](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)" in PLOS Computational Biology

Finally, a huge thanks to:

- [DataDriven](https://github.com/datadriven/) for their excellent template.
- The [Cookiecutter](https://cookiecutter.readthedocs.org/en/latest/) project ([github](https://github.com/audreyr/cookiecutter)), which is helping us all spend less time thinking about and writing boilerplate and more time getting things done.
- [Stefan Buck](https://github.com/stefanbuck/) for his [ristorante](https://github.com/stefanbuck/ristorante) GitHub Issue Forms (Beta) example
- Stefan Buck, again, for his cookiecutter github action on GitHub Marketplace.
