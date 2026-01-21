---
title: '3D Printing Design Advice'
date: 2026-01-21 00:00:00
excerpt: "My advice on designing parts for 3D printing"
permalink: /posts/2026/01/design-for-3d-printing/
last_modified_at: 2026-01-21 00:00:00
---

# Design for 3D printing
3D printing is a very powerful tool. It is great for rapid prototyping, however it has its limitations. As good engineers, we need to be aware of these limitations so we can mitigate them. Here is a short list of limitations that I am mindful of when 3D printing:
1. Dimensional Accuracy
2. Part strength: layer lines
3. Support
4. Surface Finish

## 1. Dimensional Accuracy
Dimensional accuracy is often the biggest hurdle in 3D printing. A $1,000 hobbyist printer typically achieves an accuracy within ±0.2 mm. In contrast, I have machined parts on a lathe and mill to within ±0.025 mm. Because tolerances in 3D printing are often the widest among custom manufacturing methods, designing with these offsets in mind is critical.

## 2. Part strength
It is naive to assume part strength is solely a function of material. 3D printing is anisotropic, meaning its properties change based on direction. Because FDM prints are composed of stacked layers, the bonds between these layers are the primary weak points.

Virtually all commercial 3D printing methods are layer-based; shear strength is usually weakest along the layer lines, while tensile strength is weakest when pulled perpendicular (normal) to those lines.
![Layer line illustration](/images/blogs/3d-printing/layer-line-illustration.png)
From [UnionFab](https://www.unionfab.com/blog/2023/12/3d-print-screws-and-bolts)

## 3. Support
Designing for minimal support is a vital skill. Minimizing support reduces print time, improves surface finish, and increases the likelihood of a successful print. I have seen 100g parts printed with 300g of support material—effectively quadrupling the print time and significantly increasing the risk of failure.

Know when support is truly necessary. Many printers can handle holes and moderate overhangs without help. To find your machine's limits, I recommend running a "torture test." Common tests include the 3DBenchy, the XYZ Calibration Cube, and specialized overhang/bridging tests. There's a million articles about testing your 3D printer, from feature print ability to optimal temperature settings. This one looks good so I've put it [here](https://kingroon.com/blogs/3d-print-101/top-3d-print-test-methods
). The most common tests I see are the bench boat, the XYZ cube, and the overhang test.
![3DBenchy](/images/blogs/3d-printing/3DBenchy.png)
From [Creative Tools](https://www.flickr.com/photos/creative_tools/16469733254/)

## 4. Surface Finish
Surface finish is probably the least important concern in 3D printing. It is a low concern because
1. 3D printed parts rarely go into the hands of consumers and is mostly used for engineers to prototype 
2. Part print orientation can improve surface finish on key surfaces
3. Surface finish is often cosmetic

However, FDM surface finish is generally poor compared to CNC machining or injection molding. You can improve it via post-processing:
1. Ironing - A process in FDM where the heated extruder is used to iron and smooth out top surfaces
2. Solvent - In FDM this involves using acetone to smooth out layer lines in a material like ABS. In SLA, isopropyl alcohol or a dedicated solvent may be used to remove uncured resin. In multimaterial printing, a water-soluble support material may be used to easily remove supports.

# The "Chef" Mindset: Design Intention
Ok I've talked a lot about techniques in 3D printing, but I want to illustrate a skill that isn't really taught and can't be quantified.

I want you to pretend you're a chef preparing a meal. Do you start cutting vegetables before thinking about what you're trying to make? No! 
When you've forgotten an ingredient do you leave the stove on and drive to the store and buy said ingredient? No!!

You diligently plan the night before, what steps come first, what ingredients you need to buy. Only *then* after you've planned out each step do you start prepping ingredients. And then, when you're cooking the meal you taste as you go.

Well the same meticiulous steps should be applied to CADing. I've seen other people's models littered with small changes, second thoughts that they added on later. The same concept of making coding language readable should apply to CAD. If I or even the person who designed it need to go back at the design to an intermediate step they don't even know what feature to edit. And worse they just create a new feature instead of reading the Feature Tree to edit a previous one!

Each feature in your feature should be it. Just *one* feature. Not half of a feature because you extruded a rectangle once and then realized you needed to extrude it more. Properly using the Feature Tree is not just helpful for others looking at your model but can help you organize your thoughts when you look back at your model.

Each feature on my models is just *one* feature. And I actually use the parametric modeling tools. Unfortunately SolidWorks make using best practices a nightmare. I think these days SolidWorks' only advantage is that it can be used for large assemblies. But its ability is why I advocate for software like Autodesk Fusion, parametric modeling is much easier.

Even if you've used SolidWorks before, did you use it well? How do you know?

I suggest before opening SolidWorks to watch a video of a professional using it - do you do the same things they do? I guarantee you the workflow looks much differently.

## Preparation
Before you even create your first sketch - I suggest you try to draw what you're creating - what key features are you going to focus on? What key dimensions are relevant to the project? While it might seem slower at first to plan on paper, when you make mistakes - simply start a new page, it's far easier to scrap the paper than delete a part or press the undo key dozens of times, undoing many parts that were important.

## Following your instructions
Ok so now we've actually prepared, only then can we cook. 

## Taste as you go: Testing
Let's say I'm 3D printing a part and I don't know the dimensions for a press fit. 3D printing after all is an inaccurate process, an interference fit on CNC may not be the same for 3D printing. Should I print the entire part and hope I got it right? Of course not.

We should print a small test print that tests this key dimension, heck try 3 different fits and label them, make a guide tool of 10 different increments. Play with the slicer settings. Label all your tests and keep them at your desk.

# Summary
3D printing’s accessibility isn't an excuse for sloppy engineering. By understanding its mechanical limitations and approaching CAD with a structured, "plan-first" mindset, you will produce parts that aren't just functional, but professional.