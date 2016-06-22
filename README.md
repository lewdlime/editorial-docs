# README
This project is a configuration to build a [Dash](http://kapeli.com/dash) API Docset archive for the [Editorial](http://omz-software.com/editorial/) iOS app by Ole Zorn. Editorial is packaged as a highly configurable / customizable [Markdown](https://daringfireball.net/projects/markdown/), [Fountain](http://fountain.io/syntax), [TaskPaper](http://guide.taskpaper.com/), and plain text editor app for iOS devices.

The docset(s) this configuration can create are intended for use within the Dash API browser, developed by Bogdan Popescu, either on Mac OS X / macOS, or within the [iOS app](https://kapeli.com/dash_ios). The docset(s) can also be used in other 3rd party apps that use the same format, such as [Zeal](https://zealdocs.org/) (cross-platform), or [Velocity](http://velocity.silverlakesoftware.com/) (Windows only).

The reason this docset is necessary is that Editorial contains an embedded Python interpreter & integrated script editor for Python scripts, as well as custom modules specifically designed for Editorial. While Editorial's Python interpreter doesn't include as many 3rd party modules as it's cousin, [Pythonista](http://omz-software.com/pythonista/), it still has a vast amount of modules included by default. This docset is meant to provide a reference for the Python configuration present in Editorial, to make it easier for users to write Python extensions intended for use in Editorial.

## Building

To build the docset, you will first need the [doc2dash](https://github.com/hynek/doc2dash) tool. I advise also using a [virtual environment](https://github.com/pypa/virtualenv), as installing `doc2dash` with `pip` installs pinned versions of the following packages:

* `Sphinx` 1.3.5
* `attrs` 15.2.0
* `beautifulsoup4` 4.4.1
* `click` 6.3
* `colorama` 0.3.7
* `lxml` 3.4.4
* `six` 1.10.0
* `zope.interface` 4.1.3

While `doc2dash` may still work with updated versions of these dependancies, it wouldn't be wise to overwrite any previous versions of these packages installed in your system's Python environment, nor would it be wise to cause `doc2dash` itself to break.

To generate Editorial's docset:

```bash
cd <cloned-repo-directory>
mkdir _build
doc2dash -n Editorial -d _build -f -i icon.png -I index.html -j -u http://omz-software.com/editorial/docs/ Documentation/
cp 'icon@2x.png' _build/Editorial.docset/
# If updating the Dash-User-Contributions docset:
cd _build && tar --exclude='.DS_Store' -cvzf Editorial.tgz Editorial.docset
```

Once the docset is created, move the `Editorial.docset` folder to the directory your docset browser looks for docsets.
