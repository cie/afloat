record Boat {
  x: Number,
  y: Number
}

module Boat {
  fun angle() {
    `Math.sin(#{Clock.t / 6.28 / 3})` * 9 * `Math.PI / 180`
  }
  
  fun draw(boat: Boat): Drawing {
    Drawing.path([
      Path::Move(-15, -10),
      Path::Quad(6, -11, 15, 0),
      Path::Quad(6, 11, -15, 10),
      Path::Line(-15, -10),
      Path::Close
    ])
    |> Drawing.rotate(angle())
    |> Drawing.translate(boat.x, boat.y)
    |> Drawing.fill("#ed0")
  }

  fun update(boat: Boat): Boat {
    if (boat.y > Sea.shore.y + 10) {
      boat
    } else {
      Sea.waves |> Array.reduce(boat, toss)
    }
  }

  fun toss(boat: Boat, wave: Wave): Boat {
    let r = Clock.t - wave.t
    let lastr = Clock.lastt - wave.t
    let d = Math.sqrt(Math.pow(boat.x - wave.x, 2) + Math.pow(boat.y - wave.y, 2))
    if (d < r && r < (d + 5) || (d - 5) < (-r) && (-r) < (d )) {
      let angle = `Math.atan2(#{boat.y - wave.y}, #{boat.x - wave.x})`
      {
        x: wave.x + `Math.cos(#{angle})` * Math.abs(r),
        y: wave.y + `Math.sin(#{angle})` * Math.abs(r)
      }
    } else {
      boat
    }
  }
}