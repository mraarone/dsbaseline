import sys


def test_environment():
    system_major = sys.version_info.major

    required_major = 3

    if system_major != required_major:
        raise TypeError(
            "This project requires Python {}. Found: Python {}".format(
                required_major, sys.version
            )
        )
    else:
        print(">>> Development environment passes all tests!")

    assert system_major == required_major


def main():
    test_environment()


if __name__ == "__main__":
    main()
