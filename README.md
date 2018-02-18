# .emacs.d
_My emacs config_

Taking ideas from this github [awesome list](https://github.com/emacs-tw/awesome-emacs).

#### Notable configs to look at for ideas:
- https://github.com/howardabrams/dot-files
  - Org config to the extreme! Lots of detail and notes on what he is doing.
- https://github.com/gfanton/dotemacs
  - Uses Org config and web dev w. php
- https://github.com/aaronbieber/dotfiles/tree/master/configs/emacs.d
  - Vim -> Emacs convert. Lots of custom stuff and aiming at reproducing his vim
    config in emacs.


## Functionality to find packages / config for
#### Languages
- go, Haskell, Rust, php, Java, JavaScript, R, C
- https://github.com/ejmr/php-mode

#### Tim Pope!
- repeat, surround, unimpaired, vinegar (quick file open), tabularise (text alignment)
--> TBH, I think evil mode has a lot of these built in.

#### Org
- https://orgmode.org/
- https://github.com/alphapapa/org-protocol-capture-html
- https://github.com/org-trello/org-trello
- https://github.com/coldnew/org-ioslide

## Revisit config
### Evil
  - Get this configured correctly to map over everything from my vimrc.
  - Try looking at this: https://github.com/jojojames/evil-collection
### Indentation
  - This still seems to mess up occasionally in Python...
  - The default mode seems to be **electric indent mode** but try taking
    a look at https://github.com/Malabarba/aggressive-indent-mode as well.
### projectile
  - https://github.com/bbatsov/projectile
### Magit
  - https://magit.vc/
  - https://github.com/emacs-evil/evil-magit
  - Find a way to get my current **Gblame** behaviour in a gutter
    rather than trashing the current buffer with a tonne of inline
    information...
### helm
  - https://github.com/emacs-helm/helm
  - There is still a _lot_ to tinker with here!
### smex
  - https://github.com/nonsequitur/smex/
  - This may be unneccessary with helm also installed but take a look
### helm-swoop
  - https://github.com/ShingoFukuyama/helm-swoop
  - This isn't working correctly at the moment: see the example config
    at the bottom of the github README for some ideas to try.
### company :: autocompletion
  - https://company-mode.github.io/
### flycheck :: linting
  - https://github.com/flycheck/flycheck
### anaconda mode
  - https://github.com/proofit404/anaconda-mode
  - Make sure that this is set up correctly
### which-key
  - https://github.com/justbur/emacs-which-key


## Packages to look into
### dash
  - https://github.com/magnars/dash.el
  - VERY useful list manipulation functions for when I'm writing my own functions.
### Tab bar
  - https://github.com/dholm/tabbar
  - https://www.emacswiki.org/emacs/TabBarMode
### god mode
  - https://github.com/chrisdone/god-mode
  - This uses an escape key to effectively drop emacs into a vim style
    Normal mode. It replaces modifier keys with prefix arguments so it
    does get a little involved but the parsing of key chords is automatic.
    - Spacemacs makes use of this I think.
### ranger
  - https://github.com/ralesi/ranger.el
  - Ranger re-write in elisp. Better file navigation than dired.
### emacs-neotree
  - https://github.com/jaypei/emacs-neotree
  - NERDtree style file navigation.
### rainbow colours
  - https://julien.danjou.info/projects/emacs-packages
  - Highlight hex colours in the correct colour.
### paragraph focus
  - https://github.com/larstvei/Focus
  - worth a look?
### yasnippet :: templating
  - https://github.com/joaotavora/yasnippet
### web-mode
  - http://web-mode.org/
  - manage files with a mix of html/css/js
### emmet-mode
  - https://github.com/smihica/emmet-mode
  - css style snippet expansion
### impatient-mode
  - https://github.com/skeeto/impatient-mode
  - live view of edits to html
### virtualenvwrapper
  - https://github.com/porterjamesj/virtualenvwrapper.el
  - manage using venvs from emacs
### slack (!)
  - https://github.com/yuya373/emacs-slack
