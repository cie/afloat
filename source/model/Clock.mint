store Clock {
  state t = 0
  state last = 0

  fun tick (ms : Number) : Promise(Void) {
    AnimationFrame.request(Clock.tick)
    next { t: ms / 1000, last: ms }
  }
}
