# Self-Healing Microservices with Kubernetes (unpublished Paper) [![Build Status](https://travis-ci.com/CodeLionX/selfhealing-k8s-paper.svg?token=pqFUU2qudhkNenBcNwxf&branch=master)](https://travis-ci.com/CodeLionX/selfhealing-k8s-paper)

**The PDF version of this paper is included in this repository. You can download it from [`Self-Healing.pdf`](https://github.com/CodeLionX/selfhealing-k8s-paper/raw/master/Self-Healing.pdf).**

## Abstract

One essential part of a self-adaptive system is its self-healing capabilities.
Self-healing systems monitor the running application and try to keep the system in a healthy state to increase availability and adapt to unexpected changes.
Therefore, they have to be fault tolerant, mask temporary failures, maintain essential services, and recover from the failures in a finite amount of time to reach the healthy system state again.
In cloud environments, self-healing techniques are already used in form of tools that try to achieve continuous availability for cloud services.

In this paper, we take a look at the self-healing capabilities of Kubernetes for microservice architectures in the cloud and compare it to the approaches in self-healing literature.
We find that Kubernetes' approach is a form of architecture-based self-healing and that Kubernetes implements all important aspects of self-healing systems.
However, Kubernetes depends on the underlying infrastructure to provide fault-tolerant persistent volumes, must run in an highly available setup to be itself resilient in case of Kubernetes master component failures.

## Repository Contents

The main file is called `paper.tex`.
It contains the preamble and document setup stuff.
Content of the paper is structured in the file `paper_toc.tex`.
Each `section` should live in its own file in the folder `sections`.

All kind of pictures should be saved in the folder `pictures`.

I use the LaTeX class for submission to _Lecture Notes in Informatics_ (LNI) from their
[Github repo](https://github.com/gi-ev/LNI) with some small modifications:

- fixed some small bugs
- added option to remove editorial information from the first page, called `noeditorial`

The required files can be found in the folder `lni-tex`.

The style files required for bibliography style _LNI_ are located in the root folder.
This is required like that by biblatex.
We use the _LNI_ style from [gi-ev/biblatex-lni](https://github.com/gi-ev/biblatex-lni).

## Build

This repository uses [Travis](https://travis-ci.com/) to build the resulting LaTeX PDF.
The PDF is built only for the branches `master`, `btw`, `ci-*` and `ci/*` and pushed back to this repository via a commit by Travis.

Please be aware that every _push_ to the `master`-branch will trigger a build of the PDF and the corresponding commit by Travis.
This will force you to re-sync your local repository's master branch (`git pull`) before you can push again.

### Use Travis to generate a current snapshot PDF

You can instruct Travis CI to build the current version of the PDF and push it back to your branch via putting `[build pdf]` in your commit message.
This is independent from the branch-dependent build-rules and works in every branch.
