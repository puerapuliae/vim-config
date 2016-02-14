XPTemplate priority=personal


XPTvar $BRif ' '
XPTvar $BRel \n
XPTvar $BRloop ' '
XPTvar $BRfun ' '
XPTvar $author 'Bjoern Klatt'
XPTvar $email bk@puerapuliae.net

XPTinclude
    \ java/java

let s:f = g:XPTfuncs()

function! s:f.year(...)
  return strftime("%Y")
endfunction

function! s:f.getPackageForFile(...)
    let dir = expand('%:p:h')
    let regexes = [
                \   [ '/src/main/scala',      '/src/main/scala' ],
                \   [ '/src/test/scala',      '/src/test/scala' ],
                \   [ '/app/model/scala',     '/app/model/scala' ],
                \   [ '/app/controllers',     '/app' ],
		\   [ '/src',		      '/src']
                \ ]
    for e in regexes
      let idx = match(dir, e[0])
      if idx != -1
        let subdir = strpart(dir, idx + strlen(e[1]) + 1)
        let package = substitute(subdir, '/', '.', 'g')
        return package
      endif
    endfor
    return ''
endfunction

function! s:f.classname(...)
  return expand('%:t:r')
endfunction

function! s:f.classNameFromSpec(...)
  return substitute(s:f.classname(), 'Spec$', '', '')
endfunction

function! s:f.classNameFromTest(...)
  return substitute(s:f.classname(), 'Test$', '', '')
endfunction

function! s:f.getFilenameWithPackage(...)
    let package = s:f.getPackageForFile()
    if strlen(package) == 0
        return expand('%:t:r')
    else
        return package . '.' . expand('%:t:r')
    endif
endfunction

function! s:f.getPackageLine(...)
    let package = s:f.getPackageForFile()
    if strlen(package) == 0
        return ''
    else
        return "package " . package
    endif
endfunction

function! s:f.getCurrentDir(...)
  return expand('%:p:h:t')
endfunction

XPT file hint=Standard\ Scala\ source\ file
//
// `getFilenameWithPackage()^
//
// Copyright (c) `year()^ Bjoern Klatt (bk@puerapuliae.net)
//
`getPackageLine()^
`cursor^

XPT main hint=Creates\ a\ "Main"\ object
object `objectName^ {
    def main(args: Array[String]) {
        `cursor^
    }
}

XPT app hint=Creates\ an\ "App"\ object
object `classname()^ extends App {
    `cursor^
}

XPT afun hint=Creates\ an\ anonymous\ function
() => {
    `cursor^
}

XPT cc hint=Creates\ a\ case\ class
case class `className^(`...^`attrName^: `type^`...^)

XPT co hint=Creates\ a\ case\ object
case object `objectName^

XPT case hint=Creates\ a\ case\ statement
case `matchAgainst^ =>

XPT wrapin wrap=code hint=Wraps\ in\ a\ block
`prefix^ {
    `code^
}

XPT match hint=Creates\ a\ pattern\ matching\ sequence
`target^ match {
    `...^case `matchTo^ => `statement^
    `...^
}

XPT flat hint=Creates\ a\ new\ FlatSpec\ test\ file
`getPackageLine()^

import org.scalatest._

class `classname()^ extends FlatSpec with Matchers {
    "A `class^" should "`spec^" in {
      `cursor^
    }
}

XPT fit hint=Creates\ a\ new\ FlatSpec\ test\ block
it should "`spec^" in {
  `cursor^
}

XPT eorp hint=envOrNone.orElse.propOrNone
envOrNone("`Variable^").orElse(propOrNone("`property^"))

XPT proj hint=SBT\ Project
import sbt._

class `project^Project(info: ProjectInfo) extends `DefaultProject^(info) {
    `cursor^
}

XPT projDepend hint=SBT\ Project\ dependency
XSET type=ChooseStr( 'provided', 'test', 'compile' )
lazy val `depName^ = "`package^" % "`name^" % "`version^" % "`type^"

XPT package hint=package\ for\ this\ file
`getPackageLine()^

XPT bookblock wrap=code hint=Wraps\ a\ block\ of\ code\ in\ BEGIN/END
// FILE_SECTION_BEGIN{`name^}
`code^
// FILE_SECTION_END{`name^}

XPT mod hint=New\ module\ for\ dependency
"`groupId^" `%%^ "`artifactId^" % "`revision^"

XPT be hint=x\ must\ be\ \(y\)
`object^ must be (`target^)

XPT notbe hint=x\ must\ not\ be\ \(y\)
`object^ must not be (`target^)

XPT sbt hint=Creates\ a\ new\ build.sbt\ file
XSET name|def=getCurrentDir()
name := "`name^"

version := "`0.1^"

scalaVersion := "`2.10.3^"
`^

XPT dep hint=libraryDependencies\ :=\ Seq\(...\)
libraryDependencies := Seq(
    "`groupId^" % "`artifactId^" % "`revision^",
    "org.scalatest" %% "scalatest" % "2.1" % "test"
)
