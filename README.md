# NoTeX

_A custom template for taking notes_

---

## 0) Yeah sure, but what **_IS_** NoTeX to begin with?

In this repository I want to publish the template that I use for taking notes during university classes. I will update it from time to time. If you want to see my notes they'll eventually be uploaded in an (_maybe_) accesible cloud, since I'm not feeling like sharing them at the moment.

The template is under GPL license (until I will find a CC 4.0 license file to replace the GPL one), but it's not excluded that one day I'l write my own license. You are free to use my template, as long as you credit me. It's fine if you want to edit the template, based on your needs, but don't edit a couple lines and then sell it as your own template

---

## 1) File structure

How does the template work? In order to answer such question is worth mentioning the file structure. The template is based on this structure here:

```
├ 📁 chapters
│ ├ 📄 chap0_license.tex
│ ├ 📄 chap1_lorem.tex
│ ├ 📄 chap2_ipsum.tex
│ └ 📄 ...
│
├ 📄 main.tex
├ 📄 preamble.tex
└ 📄 title.tex
```

whereas:
+ **📁 chapters**: is the folder with all the chapters (the name of the files can also not necessarily be `chapXX_lorem_ipsum.tex`);
+ **📄 main.tex**: is the main file, where all the other files are imported (such as the `preamble` and the `title`);
+ **📄 preamble.tex**: is the preamble file, where all the project's settings are stored (so where all the packages are imported, where all the commands are defined, etc... If you want to change something of the notes, you should do it here);
+ **📄 title.tex**: is the file with the first page's code.