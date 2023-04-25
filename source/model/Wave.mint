module Wave {
  fun new(x: Number, y: Number, t: Number): Wave {
    `{x: #{x}, y: #{y}, t: #{t}}`
  }

  fun draw(w: Wave, t: Number): Html {
    <circle cx={`#{w}.x`} cy={`#{w}.y`} r={`#{t}-#{w}.t`} />
  }
}