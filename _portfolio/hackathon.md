---
title: "CalHacks Hackathon - Robot Arm"
excerpt: "<img src='/images/hackathon/robot-arm.png' style='width:400px;'><br>I attended the worlds largest hackathon. Here's how it went"
collection: portfolio
date: 2025-11-06
last_modified_at: 2025-12-02 00:00:00
---
<img src="/images/hackathon/robot-arm.png" width="400">

On September 24, 2025, I attended CalHacks 12.0, the world's largest collegiate hackathon.

From their [website](https://www.calhacks.io/), CalHacks featured:
- Over 2,000 hackers
- 48 Hours of hacking
- $200,000 in prizes
- 400+ Projects

## What is a hackathon?
From [Wikipedia](https://en.wikipedia.org/wiki/Hackathon)
> A Hackathon is an event where people engage in rapid and collaborative engineering over a relatively short period of time such as 24 or 48 hours. They are often run using agile software development practices, such as sprint-like design wherein computer programmers and others involved in software development, including graphic designers, interface designers, product managers, domain experts, and others collaborate intensively on engineering projects, such as software engineering.

At the end of the 48-hour period, teams will submit their project to cease development, and present their project idea to a panel of judges. Typically in a casual, standing around at a table looking at a laptop type way.

## CalHacks' Unique Offering: The Hardware Track
Traditionally a hackathon features only software development (hence 'hack'-a-thon): it's free to develop, often requires no infrastructure to provide, and keeps the playing field consistent for judges to assess.

However, CalHacks featured the unique option of competing in a Hardware Track. This would allow teams to develop hardware that the event coordinators provided. Given my background in mechanical engineering and the idea I had to leverage the hardware track, I decided to compete in it.

# Project
## Strategy
Before I explain my idea, I want to explain my thought process:
Hackathon judges are looking for certain criteria. Specifically, I believe they're looking for 4 things. Nail these 4 things and you have a winning idea:
1. A minimum viable product
2. A business plan with reasonable revenue
3. Something novel
4. A long term business strategy

### Minimum Viable Product (MVP)
This is the most basic thing that should be done in a hackathon. But it's still essential. You need to build an MVP in 48 hours. If your demo doesn't work, and if you can't demonstrate how your solution solves a problem, then you're not going to win anything.

### Revenue Revenue Revenue
Yes, judges are looking for something novel. But there's an important question that must be answered: where is the money going to come from? If the answer is I don't know, or if the business plan is awful, sure it could win novelty or cool project award, but it certainly won't come close to overall grand winner prize

Remember, you have to solve a problem. And not only solve a problem, but people will pay you to solve that problem.

### Something Novel
It's important to build a novel idea in a hackathon. *Especially* a Hackathon based from Berkeley taking place in San Francisco. It has to be techy, and appeal to tech investors even if the judges aren't necessarily Andreessen Horowitz.

You need to answer the key question: Why now? A good project is going to answer this question. Now this is probably the weakest of the 4 points I have, but if you answer this question it certainly makes your chances of winning stronger.

### Long term strategy
Part of a hackathon is creating a scrappy project in 48 hours, the codebase is a mess, but hey at least you developed your MVP, and it's kinda working. Maybe you're lacking some datasets, and you made up data, maybe your algorithm doesn't truly work, but you were able to demo how it *should* work. This flies. But you need to emphasize what your game plan is. You basically need to say to the judges: now that you think our business plan has potential here is how we would expand on our idea or here is what we would do with the prize (when the prize is often money, interview with Y Combinator, etc.)

## My Idea

### Inspiration

Earlier this week, I visited a startup in San Francisco that had nearly **$300,000 worth of robots**—but no clear direction. One engineer was tinkering with small desktop robot arms, another was experimenting with UniTree G1 humanoids, and yet another wanted to give humanoid robots *guns*. It felt chaotic—an incredible amount of hardware potential, but no cohesive vision.

Here’s what I mean by a desktop robot arm—this one is even [open-sourced for 3D printing](https://github.com/huggingface/lerobot):
![lerobot](/images/hackathon/lerobot.png)

And here’s the UniTree G1 humanoid robot:
![unitree](/images/hackathon/unitree.png)

I had no real interest in joining that startup. But as we were leaving, one of my peers offhandedly said:

> “What if you livestreamed a robot?”

That single comment sparked the entire idea.

## The MVP

My concept is simple but powerful: **mass-collect language-to-action data for humanoid robots**.

The goal is to build a framework that companies can use or buy to train robots on how to translate human intent into physical action. It’s a data-first approach to robotics: combining live user interaction, large language models (LLMs), and physical control systems.

This concept isn’t far-fetched. Many companies are already outsourcing robot teleoperation and data collection to low-cost regions, or developing tactile sensing gloves to capture human hand movements. The problem is, **none of these solutions scale**. They’re closed, proprietary, and expensive.

So I thought:

> Why not crowdsource it?
> Why not make it entertaining and data-rich at the same time?

The MVP would look like this:

* Use a basic desktop robot arm (from the Hardware Track).
* Mount two or three webcams for real-time feedback.
* Livestream the robot on Twitch.
* Let users send commands via chat.

As the robot acts, we collect several streams of data:

* **Chat logs:** What tasks do people want household robots to do?
* **Conversion logs:** How does an LLM interpret human text into robotic commands?
* **Performance logs:** How successfully did the robot complete the task?

We could even capture user feedback; for example, letting the Twitch chat rate each attempt from 1 to 10.Over time, this would produce a massive dataset linking

human intent → language → robotic execution → performance evaluation.

### Company Vision

The MVP is just the beginning. The broader vision is to create the **go-to framework for large-scale robot interaction data**. Once validated, the concept can expand both vertically and horizontally:

* **Vertically:** Improve the feedback loop, refine LLM-to-robot translation, integrate visual perception, and enable more sophisticated manipulation.
* **Horizontally:** Test across different contexts—kitchen environments, cleaning scenarios, folding clothes, or interacting with pets. Compare desktop arms, humanoids, and other robotic systems.

The innovation lies in:

* **Crowdsourced data:** free, organic, and large-scale.
* **Entertainment value:** a public livestream that educates and excites people about robotics.
* **Novelty:** no existing system combines real-time audience interaction, LLM filtering, and robotic control.
* **Scalability:** adaptable across hardware, environments, and tasks.

Ultimately, this project would serve as a **Universal Manipulation Interface (UMI)** — a modular, open-source framework for human-robot data collection. Entertainment would be the proof of concept, but the underlying technology could power training datasets for companies building humanoids, teleoperation platforms, and reinforcement learning models.

## Why It Matters

Data drives every modern breakthrough — from social media algorithms to large language models. Whoever captures the most **interaction data between humans and robots** first will define the next frontier of robotics.

This project offers a way to:

* Gather high-quality, labeled data at scale.
* Understand how humans naturally communicate with robots.
* Refine the pipeline between human intent, LLM interpretation, and robotic action.

Just as ChatGPT defined the LLM space through scale, this system could define the robotics data space through engagement and accessibility.

## Post Mortem
So why is this all a hypothetical. Well, I went to the hackathon and worked on this idea with two of my friends. And it was going really well, too well in fact. For a project that I thought would require sleepless nights and constant debugging, we actually were able to get the robot arm controlled well— We had code for robot arm control via commands, the ability to scrape any twitch chat when given a link.

Until we had to give video feed for the robot arm to understand its perception. This was probably one of the most complicated tasks it would have to do. Sure, controlling the robot before it was a required hurdle we had to learn. But controlling the robot arm was a completely different challenge. 