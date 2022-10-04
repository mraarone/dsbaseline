# Setup your Data Science Project from this Template

## Create a repository from this template

1. Click the big green button `"Use this template"` or click [here]("../../generate").
1. Enter a Repository name, click the checkbox to copy all branches, and click `"Create repository from template"`
1. Head over to the created repository and complete the setup.

## Complete setup

1. In the a new repository, create a new [issue]("../../issues/new").
1. Fill out the form, and commit the form (the commit description won't matter).
1. Wait for the [Setup Repository Action]("../../actions") to complete.
1. You'll see your project with most of the scaffolding gone.
1. Click the branches dropdown.
1. Select and merge each feature branch you want to include in your project.
1. Head over to the Actions tab and run the "Finalize Setup" workflow to clean up your new project.
1. That's it, now you have a Data Science project defined as code with Development Environment as a Service, DataOps, DevSecOps, MLOps, Infrastructure as Code, Robotic Process Automation, or whatever features you chose out of the feature branches that are available!
1. If you don't see something that you'd like integrated, please create a new [issue]("../../issues/new") or fork the project and create a new [pull request]("../../pulls") to include a new branch for your feature contribution.

---

## What is this all about?

Many fresh out of college data scientists aren't fully trained to be platform engineers, devops engineers, software engineers, networking engineers, system integrators, etc. Their job is to focus on data science. So, I set up a project automates as much as possible while inducing a well thought out standard for how data science projects are made, used, and maintained--at least in structure. Documentation to explain methodology is in the development stages. The goal is to make it easy for data scientists to focus on data science and not have to worry about the rest.

This repository is a template for creating new repositories. Once the big green button is used to create a new repository from this boilerplate template, you create an issue to further describe your project. And behind the scenes it uses [cookiecutter] to create a new repository from a template. The template is a [GitHub Action] that creates a new repository from a template and performs some setup tasks. In the end you have a customized data science project to start from.

In addition, if you choose to copy all of the branches when creating your repository from the template, you will also have additional features you can incorporate into your project. The final scaffolding is an action called "Finalize Scaffolding" that will erase the scaffolding used to create and customize your project including the scaffolding actions, issues, and unused template feature branches.

### [Project homepage](http://drivendata.github.io/cookiecutter-data-science/)

### Requirements to use the cookiecutter template

1. Github
1. Python 3.8+
1. Poetry 1.2.1+
1. An organization set up for GitHub Codespaces to use the devcontainers OR use the devcontainer in a local docker environment through VSCode and Docker Desktop, et al.

### Data Science Baseline Features

- A stellar data science project structure
- Mini X-Windows Server, Fluxbox (VNC)
- NoVNC web VNC Interface
- Docker-in-Docker (single container, does not use GitHub for more container resources)
- Kubernetes (only bills for one codespace, a trick to save money)
- Minikube
- Helm
- Bash with Oh-My-Bash
- A glorious Zshell (zsh) custom default terminal via my [dotfiles](https://github.com/mraarone/dotfiles)
- Copilot Plugin as an AI assistant for writing code
- Mintly Plugin for AI generated documentation from code
- Many other extensions (Gitlens, Markup linting, Yaml linting, Sonarcube + Bandit + Safety security linting and scans, Mypy + Pytype type linting, PEP8 correction with Black + Yapf, PEP8 linting with Flake8 and PyLance, License checks with Liccheck, PyTest testing, Pre-commit + Nox testing, etc.)
- Unit test code coverage scans
- Security is shifted left into the Progressive Web App VSCode IDE via linters and live code scanners
- DevSecOps pipeline defined by a Noxfile
- DevSecOps pipeline defined by a pre-commit hook definition
- DevSecOps configuration for VSCode using py-utils matching Microsoft's open source configuration
- Recommend copying my [dotfiles](https://github.com/mraarone/dotfiles) into your account for a massively customized ZSH experience

### The resulting directory structure

---

The directory structure of your new project looks like this:

```lang=text
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
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
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
├── src                <- Source code for use in this project.
│   └── {{ cookiecutter.repo_name }}       <- Generated graphics and figures to be used in reporting
│       ├── __init__.py    <- Makes src a Python module
│       │
│       ├── data           <- Scripts to download or generate data
│       │   └── make_dataset.py
│       │
│       ├── features       <- Scripts to turn raw data into features for modeling
│       │   └── build_features.py
│       │
│       ├── models         <- Scripts to train models and then use trained models to make
│       │   │                 predictions
│       │   ├── predict_model.py
│       │   └── train_model.py
│       │
│       └── visualization  <- Scripts to create exploratory and results oriented visualizations
│           └── visualize.py
│
└── noxfile.py             <- nox file with settings for running nox; see nox.readthedocs.io
```

## Contributing

We welcome contributions! [See the docs for guidelines](https://drivendata.github.io/cookiecutter-data-science/#contributing).

### Installing development requirements

---

```lang=bash
pip install -r requirements.txt
```

### Running the tests

---

```lang=bash
py.test tests
```
