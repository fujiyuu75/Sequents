# Sequents

<img src=https://img.shields.io/cocoapods/p/Sequents.svg> <img src=https://img.shields.io/cocoapods/v/Sequents.svg> <img src=https://img.shields.io/github/license/fujiyuu75/Sequents.svg>

<img src=https://github.com/fujiyuu75/sequents/blob/res/demo.gif width=400px>

Sequents is a library that starts animation continuously for multiple views at regular intervals.

```
# Just write a line. Default animation is Fadein.
Sequents.origin(layout).start()
```

You can change the animation settings.

```
Sequents
   .origin(UIView)
   .duration(int) // option.
   .delay(int) // option. StartOffSet time.
   .offset(int) // option. Interval time.
   .flow(Direction) // option. Flow of animations in (FORWARD/BACKWARD). 
   .anim(Context, Animation) // option. implemented Animation.
   .start()
```

Please use the following implemented animation effects.

```fadeIn``` ```fadeInDown``` ```fadeInLeft``` ```fadeInRight``` ```fadeInUp```

## Installation

### CocoaPods

Add the following to your Podfile:

```
pod "Sequents"
```

### Carthage

Add the following to your Cartfile:

```
github "fujiyuu75/Sequents"
```

Continuous animation library like Sequents is also available for [Android](https://github.com/fujiyuu75/Sequent).

## Bugs and Feedback

For bugs, questions and discussions please use the github issues.

## Lisense

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
