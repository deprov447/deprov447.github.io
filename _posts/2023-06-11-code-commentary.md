---
title: "Code Comment-ary"
date: 2022-11-20T03:53:02Z
draft: true
author: "Me"
layout: post
tags: ["general"]
showTOC: false
cover: 
    image: ""
    alt : "cover img"
    caption : ""
---

> Programs must be written for people to read, and only incidentally for machines to execute.
>  --- [Structure and Interpretation of Computer Programs](https://web.mit.edu/alexmv/6.037/sicp.pdf)

Code comments are one of the things which are as conflicted as one's belief of **best programming language**.  Some believe in no comment at all, some in extensive commenting, some in "block commenting", and others in "line commenting". What is right really depends on the situation and the needs. But choosing a good commenting strategy and knowledge of common best practices not only makes your life easy but also the lives of anyone looking at your source code. 

![code comments be like](https://i.redd.it/iuy9fxt300811.png)

There are tonnes of tools like analyzers, compilers, linters, IDEs and what not to take care of your code. But none of them could take care of your comments. Your compiler doesn't check your comments so there is no way to determine that comments are correct. And that is why you have to care about them.

And this article is all about that. It has some good insights on coding comments. which can help you write nicer comments in your next project.

## What not to comment?

First of all, (and it goes without saying) your code itself should be as readable and as simple as possible. You should strive to make your code as clear as possible without relying on comments as a crutch. Only at the point where the code _cannot_ be made easier to understand should you begin to add comments.


Code can only tell you _how_ the program works; comments can tell you _why_ it works. Try not to shortchange your fellow developers in either area.

```cpp
void foo(int n) {						// function foo denotes depth first search and takes an integer argument n, denoting the index of parent.
	arr[n] = 1;							// arr stores the nodes already visited
	for(int i=0; i<T[n].size(); ++i)	// i denotes the index of child nodes. T denotes tree stored as adjacency list.
		if(!arr[T[n][i]])				
			foo(T[n][i]);
}
```

```cpp
void dfs(int parent) {
	isVisited[parent] = true;
	for(auto child: TreeAL[parent])
		if(!isVisited[child])
			dfs(child);
}
```

See, which code was easier to understand? Even though the first one has more comments but second's more readable. Adding comments doesn't always give a positive effect. Hence it should not be used as a substitute for quality code. 

> “Any fool can write code that a computers can understand. Good programmers write code that humans can understand.” — Martin Fowler

## What to comment?

Next is what to comment? What to comments is a thing with some extremely opposing viewpoints (and surprisingly everyone is right). All of the best programmers and project maintainers have different rules of what needs commenting and how should that be commented. 

So it’s always a good idea to look into the contribution guidelines/previous work if you are contributing to an open-source project. 

![](https://i.redd.it/7dzo1rbokj871.jpg)

Here are some of the things people generally comment: 

### The Plan
Many developers try to outline their idea with comments before actually coding it. This gives the benefit of not having to remember the whole, already ideated workflow every time.

### Description
This might be the most common thing comments are used for. It involves explaining the connected code in plain English (and that means senior devs may find it annoying). 

It is a good habit to keep explaining your code keeping your target audience in mind. You may not need to explain working of a simple POST endpoint in a professional environment. 

But again, remember, code comments are not a remedy for writing bad code. You should spend a good amount of time simplifying the code, rather than commenting. A classic example: [You are not expected to understand this](https://web.archive.org/web/20070220094221/http://cm.bell-labs.com/cm/cs/who/dmr/odd.html)

### Resources
Links to standards and other documentation can help readers understand the problem your code is solving. While this information may be somewhere in a design document, a well-placed comment gives readers the pointer when and where it is most needed. Also, it’s a good habit to always give a link to the forum from where you copied a snippet ,as It allows future maintainers to make any positive changes/optimization if they come up later on. Pasting in the URL is much quicker than later finding the reference.

### Metadata
Developer sometimes use comments to store metadata about the file, like:
- The creator of the original version of the program file 
- Date when the first version was created
- Current maintainer of the program
- Who has edited the program file so far
- URL of documentation about how to use the program
- License

### Auto Documentation Syntax
A lot of cool documentation generators use the comments in the source code to automatically generate documentation for the program. Examples are Javadoc for Java, Doxygen for C, C++, etc. Forms of docstring are supported by Python, Lisp, Elixir, and Clojure.

C#, F#, and Visual Basic .NET implement a similar feature called "XML Comments" which are read by IntelliSense from the compiled .NET assembly.

## Where to comments?

![https://geekandpoke.typepad.com/geekandpoke/2011/06/code-commenting-made-easy.html](https://lh5.googleusercontent.com/rn1S8do8n_2FHFcM7wO7vZfHyZ2DUWP3ov33r30tjdxIuZiJFGKl80FHwaoYP1K4JygCDDTxs81Y7FrwUe_iD-K5yHVY14p-0mB9TfOsOoMV5RfnrItrO0wyVKEp-Dn0B-99jlI3)

#### The top of a program file

It is called the **Header comment**. It is generally used to store metadata about the file, like who wrote it, who amended it, what the code does, IDE metadata, license, etc.

```cpp
/* === This file is part of Calamares - <https://calamares.io> ===
 *
 *   SPDX-FileCopyrightText: 2014-2015 Teo Mrnjavac <teo@kde.org>
 *   SPDX-FileCopyrightText: 2019 Gabriel Craciunescu <crazy@frugalware.org>
 *   SPDX-FileCopyrightText: 2019 Dominic Hayes <ferenosdev@outlook.com>
 *   SPDX-FileCopyrightText: 2017-2018 Adriaan de Groot <groot@kde.org>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 *
 *   Calamares is Free Software: see the License-Identifier above.
 *
 *
 */
```

The above snippet is from a file, **Settings.cpp** from a project called [Calamares](https://raw.githubusercontent.com/calamares/calamares/calamares/src/libcalamares/Settings.cpp). It shows how production level, rich code samples are using header comments.
    
#### Above functions/methods

The basic idea of a function is an abstraction. I think a function is a black box that takes some input and produces some output. What is being done in the function can be skipped (sometimes) if one knows what the end result would be.

```javascript
/* 
 * Takes an object as an argument, with valid username and password string fields;
 * Returns a 48 characters long auth token, valid for the next 24 hours.
 */
const login = ({username, password}) => {
  // ...Some complex login mechanism.... 
  return token;
};
```
The consumer of the above function would probably never need to understand its internal working as long as it has a high-level idea of what the function needs and what it returns.

And that is why the description of a function is one place comments find great use.

#### In line
Any "tricky" code where it is not immediately obvious what you are trying to accomplish, should have comments right above it or on the same line with it. Like this one:

![Inline comment examples](https://preview.redd.it/93amr9iz28yx.png?width=960&crop=smart&auto=webp&s=db81f6dfde24725374261be93cd8115869909530)

## Tags
Adding tags to your comments is also a nice thing. This allows programmers to easily find those parts of the program (probably using `grep` command).

- **BUG** – a known bug that should be corrected.
- **FIXME** – should be corrected.
- **HACK** – a workaround.
- **TODO** – something to be done.
- **NOTE** – used to highlight especially notable gotchas.
- **UNDONE** – a reversal or "rollback" of previous code.
- **XXX** – warn other programmers of problematic or misguiding code

These are just some examples. Most of the serious projects do mention tags somewhere in their contribution wiki.

## Final say

> Understand what may need comments. Your personal portfolio site probably would not need an extensive commenting strategy, but the javascript library you created would definitely need one.

Commenting thumb rules one can follow while coding can be:
-  Write the name of the program and its author
-  What the program intends the code to do
-  Whether the programmer thinks the code could be better written
-  Where the program may be incomplete or need updating

I am not an expert in any way (far from that) but I do understand the importance of good comments. And everyone should. 

Hope this article helped you understand the _reasons_ why commenting is a necessary skill in computer science. Cheers :)

