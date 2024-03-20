import os


def new(project_name: str = "NoTeX"):
    currPath = os.path.normpath(os.getcwd() + os.sep + os.pardir)
    os.chdir(currPath)
    os.mkdir("assets")
