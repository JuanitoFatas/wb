# WB -- Software Engineers's Workbook

[Background reading: Lab Notebooking for the Software Engineer](https://blog.nelhage.com/2010/06/lab-notebooking-for-the-software-engineer/)

## Installation

    $ gem install wb

## Usage

Set `wb` up first:

```
$ wb setup # wb init + wb ignore
```

This will create a config yaml at `~/.workbookrc`:

```yaml
# Auto generated by wb 1.0.0
workbook:
  working_hours: "9-17"
  personal: "~/Dropbox/workbooks/personal.md"
  work: "~/Dropbox/workbooks/work.md"
  project:
    note_folder: ".note"
```

and add following to `~/.gitignore_global`:

```
# ignore project notes by https://github.com/juanitofatas/wb
/.note/
```

To open a global workbook:

```
wb
```

This will open workbook based on the working hour set in `~/.workbookrc`.

Inside working hour `wb` equals to:

```
wb work
# opens "~/Dropbox/workbooks/work.md
```

Outside working hour `wb` equals to:

```
wb personal
# opens "~/Dropbox/workbooks/personal.md
```

Create a new workbook in the project you are working:

```
wb new
```

by default it creates a markdown workbook using today's date:

```
2018-09-24.md
```

The date could be overrided in `~/.workbookrc`, either at `workbook` or `project` level:

Based on [Ruby's `strftime`](https://ruby-doc.org/stdlib-2.5.1/libdoc/date/rdoc/DateTime.html#method-i-strftime):

```
workbook:
  date_format: %c
```

```
workbook:
  project:
    date_format: %D
```

The extension could be overrided in `~/.workbookrc`, either at `workbook` or `project` level:

```
workbook:
  extension: rdoc
```

```
workbook:
  project:
    extension: txt
```

Invoking `wb new` again will use your editor `$EDITOR` to open the existing workbook.

You can also create a workbook with custom name under project by:

```
(on branch fix-nasty-bugs)
git rev-parse --abbrev-ref HEAD | xargs wb new

# will create a new note named under {project.note_folder}:
# 2018-09-24-fix-nasty-bugs.md
```

Opening local / global notebooks by:

```
wb open

0: .note/2018-09-23.md
1: .note/2018-09-24.md
2: ~/Dropbox/workbooks/personal.md
3: ~/Dropbox/workbooks/work.md
```

Type in the notebook number you want to open.

If you remember the notebook name by heart, supply `NAME` to `wb open`:

```
# both works
wb open .note/2018-09-23.md
wb open 2018-09-23.md # opens .note/2018-09-23.md
wb open personal.md # ~/Dropbox/workbooks/personal.md
```

Full documentation by `wb help`:

```
wb init       Initialize wb config yaml file
wb ignore     Add {project.note_folder} to global gitignore
wb setup      wb init + wb ignore

wb config     Open wb config file

wb            Open global notebook based on {working_hours}
wb personal   Open global personal notebook
wb work       Open global work notebook

wb open       Open from all notes in {project.note_folder} and global notes
wb open NAME  Open note by NAME

wb new        Create/Open note of name {date_format}.{extension} under {project.note_folder}
wb new NAME   Create note by {date_format}.NAME under {project.note_folder}
```

Thank you for using `wb`.

Feedback and improvement are welcome!

## License, Contributor's Guidelines, and Credits

- MIT license
- [Moya Contributors Guidelines][moya] which TLDR: means we give out push access easily and often.
- Notebook idea by [Nelson Elhage](https://blog.nelhage.com/about/)

[mit]: https://opensource.org/licenses/MIT
[moya]: https://github.com/Moya/contributors
