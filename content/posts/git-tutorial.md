---
title: A Simple Git Tutorial
date: 2020-10-08T19:36:13+05:30
---

So new to Git and Github ? And wondering what is it ? Today we are gonna talk about these things. We will start off with Git. And once you understand git, everything related is quite easy; be it GitHub, Bitbucket, GitLab etc.

## So What Is Git ?

Git is a merely a development tool, which has nothing to do with your application itself, but adds to the productivity and manageability of code.

More formally speaking, Git is a **Version Control Tool**. i.e. it helps in maintaining different versions and releases of the software.

## Installation
Type out 'Download Git' on Google and download it directly from the official website. Just install it like any other software. And voila! its good to go

> Powershell, command prompt, bash, terminal, shell... everything is same for us for now. We are gonna use them interchangeably. You can open anyone and you're good to go.

## Initialising a directory/folder with Git

Firstly we have to tell the system that some folder is a git repository (Repository is basically like a folder). This can be done by opening a shell in the folder to be initialized. Then enter the command

`git init`

This will create an empty git repository for you. Going forward..

## Saving the state of repository

Lets say you made some changes to your code and want to save the state of the directory at that moment, so that in future you can revert back to that state, if needed. So you would have to do these two things:

`git add [name_of_file]`

`git commit -m ["some_meaningful_message"]`

> Replace [content] with the corresponding content throughout this article. For ex: *git add index.html*.


and now your changes are saved. Enter the following to see your commit history : 

`git log`

You can always check the state of your repository by entering : 

`git status`

This will show you if some change is unsaved/uncommitted. Or if it is just added to staging area without being committed ( The thing we did by `git add` command ).

## Storing your repository online

Now that we have a local repo, you might want to upload it online to something like Github or Gitlab. That is quite easy. All you would have to do is create a new empty repository on these platforms (can easily be done using GUI ). And that copy the address your that repo.

Then comeback to the local repository and enter the command : 

`git remote push [copied_address] master`

If it asks you your credentials, just enter it. and voila !! Your repository has an online copy. If you ever want that repo back on your local machine, just enter : 

`git clone [address_of_online_repo]`

And you would get a local copy.

> Till now whatever we have done is basically whatever is must knows for working with Git. Now we will learn some advance and cool stuff

## Checking out a previous commit

lets say you wanted to see what you did sometimes back. You can always do that using git. Just copy the commit hashcode of your desired commit ( listed using  `git log` ). And then enter : 

`git checkout [copied_hashcode]`

and you will be on the state when desired commit was made. You can go back to your most recent commit using the same procedure.

## Working with branch

Lets say you want to make an experimental change in your code. But don't want to loose your current working state. Then you would have to use branches. 

> A new branch is basically a new pointer in your commit history. Using branch opens a lot of possibilities, like parallel experimentation.

So enough talking, How to work on a branch ? Most probably you would be on `master` branch if you are following this guide. ( You can check that using `git status` ).

So first we will create a new branch using

`git branch [name_u_want]`

Now to switch to your desired branch use

`git checkout -b [name_of_branch]`

and now just play around with your code, while a working copy is save somewhere.

## Downloading some updates of a repository

Lets say someone makes some update to a repository that you already had locally. So instead of cloning the whole repo again just use :

`git pull [address_of_repo]`


## Some other useful git command

- **`git diff [obj_1] [obj_2]`** shows the difference tween the two objects, which maybe branches, commits, working trees etc
- **`git show [commit_hash]`** shows what was changed in the given commit along with some metadata.
- **`git merge [branch_name]`** merges the given branch into the current working branch
- **`git config`** with some options is used to configure the local git environment.

## Using GUI
All we have done till now can also be done using some GUI program like **Github desktop** or **Gitkraken**. But this is not recommended because we wont be able to learn stuff. This is being mentioned here just for the sake of completion.
