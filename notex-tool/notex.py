import typer

from new import *
from rich import print


def main(operation: str,
         project_name: str = "NoTeX"):
    """
    CLI tool to manage the NoTeX package. The tool is available on [GitHub](https://github.com/ElBi21/NoTeX)
    """
    if operation == "new":
        new(project_name)
    elif operation == "package":
        print("Maybe later...")
    print("[bold green] Ciao")
    new("a")


if __name__ == "__main__":
    typer.run(main)
