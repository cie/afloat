enum Clock.Dir {
  Forward Backward Paused
}

store Clock {
  const SPEED = 5
  state t = 0
  state last = 0
  state dir = Clock.Dir::Forward

  fun tick (ms : Number) : Promise(Void) {
    AnimationFrame.request(Clock.tick)

    case (dir) {
      Clock.Dir::Forward => next {
        t: t + (ms - last) / 1000 * SPEED,
        last: ms
      }
      Clock.Dir::Backward => next {
        t: t - (ms - last) / 1000 * SPEED,
        last: ms
      }
      => next { last: ms }
    }
  }

  fun pause() {
    next { dir: Clock.Dir::Paused }
  }

  fun forward() {
    next { dir: Clock.Dir::Forward }
  }

  fun backward() {
    next { dir: Clock.Dir::Backward }
  }

}
