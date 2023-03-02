---
title: "Feature flags in Swift Projekten"
subtitle: "Wenn Dinge noch nicht fertig sind, sollten Sie nicht zugänglich sein. Wie lässt sich das auf die simpleste Weise realisieren?"
---

# Code der gar nicht erst kompilliert werden soll

```swift
class Dummy {
    func makeCoolThings() -> CoolThing {
        #if AWESOME_FEATURE
        return BetterFeature()
        #else
        return NormalFeature()
        #endif
    }
}
```

# Code der prüft, ob ein Feature verfügbar ist oder nicht

# Wenn das Backend definieren darf / soll, welche Features verfügbar sind


