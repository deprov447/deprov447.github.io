---
title: LFX Mentorship For Me
date: 2022-07-31T19:36:13+05:30
---

Hi everyone, I recently completed my LFX Mentorship project. I was a mentee for the LFXM summer term of 2022 at Pixie, a CNCF sandbox project donated by The New Relic. 

In this blog, I will be sharing my experience of mentorship. 
(TLDR; just awesome, one-of-a-kind experience <3)

If you're also applying for this (which every open-source newbie should), or have a doubt, feel free to [drop me a message](https://linktr.ee/deprov447). I'd be more than happy to help.

### What is LFX Mentorship?

Let's start this by knowing about The Linux Foundation. The Linux Foundation (LF) is a non-profit organization, that standardizes the development of the Linux kernel and also promotes open source projects such as Kubernetes, GraphQL, Hyperledger, RISC-V, Xen project, etc.

The Linux Foundation Mentorship is a program run by LF, which helps developers with the necessary skills and resources to learn and contribute to open source projects, through 3 or 6 months of internship. During this period, the mentee is guided through the development workflow and methodologies used by open source organizations, through a project.

### Selection procedure

I've been involved in open source for some time and have been applying for the mentorship, but got rejected every time. 

This time also I was going through the projects and found a particularly interesting project. It was about parsing a protocol. This took my eye as at that time I was learning networking and experimenting a lot with communications. So naturally, I got interested. After reading the project details, I went to the project's slack channel to find a mentor. Omid, one of Pixie's founding engineers, was kind enough to reply to my message and asked for a quick call. 

I talked to him and told him about my interest and how I made a preliminary Mongo wire protocol parser using Node.js as preparation. He seemed satisfied with this and told me about further steps and time commitment.

Other formalities included submitting a cover letter, and my resume. 

A few days later got this:
![Acceptance Email](https://cdn.hashnode.com/res/hashnode/image/upload/v1654069377514/mINbQmBcw.png align="center")

Finally, after applying so many times, got selected !!!

### Month 1

Started, and was introduced to my mentor Yaxiong Zhao, another founding engineer at Pixie. He told me about what we were going to do in the next 3 months. He demoed me the Pixie UI and explained to me the working of it, and how pixie catches packets (hint: [eBPF](https://docs.px.dev/about-pixie/pixie-ebpf/#title)). And then sent me the AMQP spec sheet, and how it needs to be implemented using C++. 

Yes, the protocol changed from Mongo to AMQP, and the language from Node.js to C++. But I guess a very important survival quality of industry is being flexible.

So, in the first month, I got a theoretical knowledge about AMQP wire spec and experimented with it by deploying a local RabbitMQ server, and monitoring packets using Wireshark. My mentor also tried helping me build Pixie on my local machine, but we failed, even after switching distros. At last, we were able to set up my dev environment inside a container.

...quite a month

### Month 2

In the first half of this month, I continued my research on AMQP (apparently implementing a protocol required a lot of extensive reading) and found analogies of it with protocols I was already familiar with, and kept on manually experimenting with packet translation.

3rd week of the month, It was finally time for me to start writing some code. Okay, so this was the difficult part. Having very limited knowledge of C++, continued forward. But my mentor was being an angel at this point, very patiently explaining to me, and pointing me in the right direction, making me understand every lex required. I started with implementing a data structure for storing and creating relations between packets. After some effort, finally got my PR merged.


![Commit](https://cdn.hashnode.com/res/hashnode/image/upload/v1654167110197/HguzJlWmJ.png align="center")

### Month 3

Continuing my code work, I started building a parser code. Yaxiong was very patient and helpful during this time, sending me blogs, and guides and explaining to me every little doubt I had. Thanks to him I was able to finally submit my preliminary code for parsing the code. 

And a final thing for this was to write tests. Learned google's C++ testing library. Wrote code, pushed.

### Concluding the program

Like every good thing, this also came to an end. 12 weeks just fly by --- faster than you can think --- The program opened up a new world of open source and got me introduced to a lot of professional tools and etiquette. I appreciate the time and efforts my mentor put into this program.

 
![Email](https://cdn.hashnode.com/res/hashnode/image/upload/v1654569241516/YnOCZ9G6Z.jpeg align="center")

Completing this internship was a dream come true, dodging tonnes of problems: internet, college, placement preparation, exams, everything. At many points in the internship, I was very certain I won't be able to complete the project. but:

> At some point, everything's gonna go south on you... everything's going to go south and you're going to say, this is it. This is how I end. Now you can either accept that, or you can get to work. That's all it is. You just begin. You do the math. You solve one problem... and you solve the next one... and then the next. And If you solve enough problems, you get to come home.

-- Tail ender, The Martian.
