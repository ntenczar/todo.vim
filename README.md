# todo.vim

A simple plugin for managing `*.todo` files.

```
================================= Thu Feb 20 =================================

- [work] More unit tests on [ch12345]

================================= Wed Feb 19 =================================

- [work] TPS reports
- [work] 1.5h PR review

- [misc] Finish that book I was reading
- [misc] some other item

- [beer] Dubbel brew

- [bike] 15km ride on Sat

- [life] Call mom
```

## Installation

If using [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug "ntenczar/todo.vim"
```

## Usage

#### Categories

In your `vimrc`, you can set the categories you would like highlighted as well
as their appropriate xterm color code:

```
let g:todo_categories = {
  \'work': '99',
  \'beer': '94',
  \'bike': '232',
  \'misc': '196',
  \'life': '31'
  \}
```

A handy list of color codes can be found here:
https://jonasjacek.github.io/colors/

#### :TodoDate

```
:TodoDate
```

Creates a brand new header at the top of your `.todo` file. By default, takes
the format:

```
================================= Wed Feb 19 =================================
```

where date is a `strftime` with format `'%a %b %d'`. The default line character
is `=`, and by default it will span 79 characters. All of this is customizeable:

```
let g:todo_today_date_format = '%b %d'
let g:todo_today_cols = 120
let g:todo_today_buf_char = -
```

#### Checking Off Items

`<leader> d` will mark an item as done
`<leader> f` will unmark an item as done.

By default, the checkmark character used is ✅, but can be changed:

```
let g:todo_check_char = ✓
```
