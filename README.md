<p align="center">
<img src="https://github.com/anthonyscorrea/silver-memory/blob/a712bca2516c3e860f2c61ea383a3132ead0614b/cmba-logo.svg" width="200">
</p>

# CMBA Constitution and Bylaws

The Constitution and Bylaws for the baseball league known as the [Chicago Metropolitan Baseball Association (CMBA)](#about-the-cmba).

The compiled, published text can be found in the following formats:
- [PDF](build/cmba-bylaws.pdf)
- [HTML](build/cmba-bylaws.html)
- [ePUB](build/cmba-bylaws.epub)

The source text for this document can be found in Markdown format in [src/cmba-bylaws.md](src/cmba-bylaws.md).

## Building from source

### Requirements

Building from source requires:
- [Pandoc](https://pandoc.org)
- [GNU Make](https://www.gnu.org/software/make/)

### Steps
1. Download the latest release or clone the repo: 
```
git clone https://github.com/anthonyscorrea/cmba-bylaws.git
```
2. Navigate to the root directory:
```
cd cmba-bylaws-master
```
3. Publish into desired format:
```
make {format}
```
were `{format}` is one of the below:
   - All [default]: `make all` or `make`
   - PDF: `make pdf`
   - html: `make html`
   - epub: `make epub`
5. Built files will be in the `build/` directory

## Markdown formatting

- `#` or `h1` is used for either "Constitution" or "Bylaws". They are not numbered, necessitating an `{.unnumbered}` class. 
   - Note: to get the numbering to match existing convention, a [Lua filter](https://github.com/jgm/pandoc/issues/5071#issuecomment-856918980) was required, see [jgm/pandoc#5701](https://github.com/jgm/pandoc/issues/5071)
- `##` or `h2` is used for sections
- `###` or `h3` is used for subsections

## Metadata

Metadata is stored in the `metadata.yml` file.

## Project history

The constitution and bylaws were modernized in 2021, using Google Docs. This project brings that effort into Git and Github. Previous commits show a generated plain-text history of the changes prior to this project (thanks to [gitdriver](https://github.com/larsks/gitdriver)), with the first being the version from 2016.

## Spell-checking
Spell-checking is performed on the pre-commit via [.spell-check/git-spell-check](.spell-check/git-spell-check) (courtesy of [mprpic/git-spell-check](https://github.com/mprpic/git-spell-check))

You can manually run spell-checking of all markdown files by running the script (requires [aspell](http://aspell.net)):

```console
./.spell-check/spell-check
```

Should you want to bypass the pre-commit hook (though not recommended), you can commit with 
```console
git commit --no-verify".
```

## To-Do
- [X] Spell Checking 
- [ ] Remove dependence on make, verify Windows support

## About the CMBA
This baseball league known as the [Chicago Metropolitan Baseball Association (CMBA)](http://cmbabaseball.com) has been formed for the purpose of providing the finest amateur baseball league in the State of Illinois and Midwest; a league where an up and coming young prospect for professional baseball may play and develop; where the talented veteran player can enjoy playing among the best competition; and bring friendship and sportsmanship to the Association.

