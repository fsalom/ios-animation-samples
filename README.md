![author](https://img.shields.io/badge/author-fernando%20salom-red)

# Animation samples

## ✍️ About

This repo contains a bunch of animation UIKit sample to integrate in your projects. 

## 📋 Table of content

### UI Animation

### Transitions
- [Modification of present](#Modification-of-present)
- [Custom transition from a tableViewCell](#Custom-transition-from-a-tableViewCell)

## 🎬 Transitions

### Modification of present
Custom transition for present controller. Using `UIViewControllerTransitioningDelegate` you can manipulate the transition between 2 viewcontrollers. In this case we have 2 viewcontrollers (A and B) where A is presenting B but we have change its behaviour to make it different.

Expected behaviour             |  Modified behaviour       
:-------------------------:|:-------------------------:|
![video](README/transition-1A.gif)  |  ![video](README/transition-1.gif)

### Custom transition from a tableViewCell
Custom transition from an element. Using `UIViewControllerTransitioningDelegate` and a `NSObject` we can create an animation from a single element

Expected behaviour             |  Modified behaviour       
:-------------------------:|:-------------------------:|
![video](README/transition-1A.gif)  |  ![video](README/transition-2.gif)

## License
[MIT](https://choosealicense.com/licenses/mit/)