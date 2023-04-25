record Shore {
  y: Number
}

module Shore {
  fun draw(shore: Shore) {
    Drawing.rect(0, shore.y, 10000, shore.y + 10000)
    |> Drawing.fill("#fed")
  }
}