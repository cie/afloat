store Sea {
  state waves = [ ] of Wave
  state boats = [ { x: 200, y: 200 } ] of Boat
  state shore = { y: 500 }

  fun addWave (wave : Wave) {
    next
      {
        waves:
          waves |> Array.push(wave)
          |> Array.push({ x: wave.x, y: 2 * Sea.shore.y - wave.y, t: wave.t })
      }
  }

  fun draw() {
    Drawing.each([
      Drawing.each(waves |> Array.map(Wave.draw)),
      shore |> Shore.draw,
      Drawing.each(boats |> Array.map(Boat.draw))
    ])
  }

  fun update() {
    next {
      boats: boats |> Array.map(Boat.update),
    }
  }
}
