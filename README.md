# Setup

### Create a repository from this template

1. Click the big green button `Use this template` or click <a href="../../generate">here</a>.
1. Enter a Repository name and click `Create repository from template`
1. Head over to the created repository and complete the setup.

### Complete setup

1. In the a new repository, <a href="../../edit/main/cookiecutter.json">complete the project setup</a> by editing the `cookiecutter.json` file.
1. Hit <kbd>cmd</kbd> + <kbd>S</kbd> and then <kbd>Enter</kbd> to perform a commit (the commit message doesn't really matter).
1. Wait <a href="../../actions">Setup Repository Action</a> to complete.
1. That's it, easy isn't it?

If you have anything to add, please reply in this [Twitter thread]().

---

# What is this all about?

On June 6, 2019, [GitHub introduced Repository Templates](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates/) giving users an easy way to share boilerplate for their projects. This feature is fantastic, but lacking adoption to my knowledge and opinion for one reason... [Read the full blog post](https://stefanbuck.com/blog/repository-templates-meets-github-actions) to learn how to template new projects using repository templates and GitHub Actions.# Cookiecutter Data Science

_A logical, reasonably standardized, but flexible project structure for doing and sharing data science work._

#### [Project homepage](http://drivendata.github.io/cookiecutter-data-science/)

### Requirements to use the cookiecutter template:

---

- Python 2.7 or 3.5+
- [Cookiecutter Python package](http://cookiecutter.readthedocs.org/en/latest/installation.html) >= 1.4.0: This can be installed with pip by or conda depending on how you manage your Python packages:

```bash
$ pip install cookiecutter
```

or

```bash
$ conda config --add channels conda-forge
$ conda install cookiecutter
```

### To start a new project, run:

---

    cookiecutter -c v1 https://github.com/drivendata/cookiecutter-data-science

[![asciicast](https://asciinema.org/a/244658.svg)](https://asciinema.org/a/244658)

### New version of Cookiecutter Data Science

---

Cookiecutter data science is moving to v2 soon, which will entail using
the command `ccds ...` rather than `cookiecutter ...`. The cookiecutter command
will continue to work, and this version of the template will still be available.
To use the legacy template, you will need to explicitly use `-c v1` to select it.
Please update any scripts/automation you have to append the `-c v1` option (as above),
which is available now.

### The resulting directory structure

---

The directory structure of your new project looks like this:

```
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
│   └── {{cookiecutter.repo_name}}       <- Generated graphics and figures to be used in reporting
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

    pip install -r requirements.txt

### Running the tests

---

    py.test tests
