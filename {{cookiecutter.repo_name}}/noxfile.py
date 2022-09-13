"""Nox sessions."""
import os
import tempfile

import nox
from nox_poetry import Session

packages = "{{ cookiecutter.repo_name }}"

nox.options.reuse_existing_virtualenvs = True

nox.options.sessions = (
    "isort",
    "black",
    "flake8",
    "safety",
    "bandit",
    "liccheck",
    "mypy",
    "pytype",
    "pytest",
    "xdoctest",
    "sphinx",
)

locations = "src", "tests", "noxfile.py", "docs/conf.py"


@nox.session(python="3.8")
def isort(session: Session) -> None:
    """Run black code formatter."""
    session.install("isort")

    args = session.posargs or locations
    session.run("isort", *args)


@nox.session(python="3.8")
def black(session: Session) -> None:
    """Run black code formatter."""
    session.install("black")

    args = session.posargs or locations
    session.run("black", *args)


@nox.session(python=["3.8"])
def flake8(session: Session) -> None:
    args = session.posargs or locations
    session.install("flake8", "flake8-bugbear", "flake8-import-order")
    session.run("flake8", *args)


@nox.session(python=["3.8"])
def safety(session: Session) -> None:
    """Scan dependencies for insecure packages."""
    session.install("safety")

    with tempfile.NamedTemporaryFile() as requirements:
        session.run(
            "poetry",
            "export",
            "--dev",
            "--format=requirements.txt",
            "--without-hashes",
            f"--output={requirements.name}",
            external=True,
        )
        session.run("safety", "check", f"--file={requirements.name}", "--full-report")


@nox.session(python="3.8")
def bandit(session: Session) -> None:
    """SCA check for CVEs using bandit."""
    args = session.posargs or locations
    session.install("bandit")
    session.run("bandit", "-r", "-lll", *args)


@nox.session(python="3.8")
def liccheck(session: Session) -> None:
    """License check using liccheck."""
    session.run_always("poetry", "install", external=True)
    session.install("liccheck")

    with tempfile.NamedTemporaryFile() as requirements:
        session.run(
            "poetry",
            "export",
            "--dev",
            "--format=requirements.txt",
            "--without-hashes",
            f"--output={requirements.name}",
            external=True,
        )
        session.run("liccheck", "-r", f"{requirements.name}")


@nox.session(python="3.8")
def mypy(session: Session) -> None:
    """Type-check using mypy."""
    args = list(session.posargs or locations)

    dir = os.listdir("./tests")

    if dir is None or len(dir) == 0:
        args.remove("tests")

    session.install("mypy")
    session.run("mypy", "--ignore-missing-imports", *args)


@nox.session(python="3.8")
def pytype(session: Session) -> None:
    """Type-check using pytype."""
    args = session.posargs or ["--disable=import-error", *locations]
    session.install("pytype")
    session.run("pytype", *args)


@nox.session(python="3.8")
def pytest(session: Session) -> None:
    """Run the test suite."""
    args = session.posargs or ["--cov", "-m", "not e2e"]
    session.install("pytest", "pytest-cov", "pytest-mock", "typeguard")
    session.run(
        "pytest", "--cov", f"--typeguard-packages={packages}", *args, silent=False
    )


@nox.session(python="3.8")
def xdoctest(session: Session) -> None:
    """Run examples with xdoctest."""
    args = session.posargs or ["all"]
    session.install("xdoctest")
    session.run("python3", "-m", "xdoctest", packages, *args)


@nox.session(python="3.8")
def sphinx(session: Session) -> None:
    """Build the documentation."""
    args = session.posargs or ["docs", "docs/build"]
    session.install("sphinx", "sphinx-autodoc-typehints")
    session.run("sphinx-build", *args)
