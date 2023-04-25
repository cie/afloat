store Clock {
  const SPEED = 5
  state t = 0
  state last = 0

  fun tick (ms : Number) : Promise(Void) {
    AnimationFrame.request(Clock.tick)
    next { t: ms / 1000 * SPEED, last: ms }
  }
}
