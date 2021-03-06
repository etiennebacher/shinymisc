#' Create cards for the tinyslider carousel
#'
#' @param title Title of the card
#' @param subtitle Subtitle of the card
#' @param content Text of the card
#' @param button_text Display some text inside a button placed at the bottom of the card. If `NULL`, the button is not created.
#' @param image An image to place on top of the card.
#' @param width Width of the card as a character, in px or in %.
#'
#' @details `tinyslider_card` and `tinyslider_card_2` are very similar. The only difference is in the layout of the card. The latter creates a card with two columns. If `image` is not `NULL`, `tinyslider_card` puts an image at the top of the card, and `tinyslider_card_2` puts an image in the left column.
#'
#' @return A card in HTML code.
#'
#' @name tinyslider_cards
#'
#' @examples
#' \dontrun{
#' tinyslider_card("This is a title", "This is a subtitle")}
#' @importFrom shiny tags
#' @export
tinyslider_card <- function(title = NULL, subtitle = NULL, content = NULL, button_text = NULL, image = NULL, width = NULL) {


  ### button
  if (!is.null(button_text)) {
    button <- tags$div(
      class = 'btn',
      tags$button(button_text)
    )
  } else {
    button <- NULL
  }

  ### image
  if (!is.null(image)) {
    pic <- tags$div(
      class = 'img',
      tags$img(src = image)
    )
  } else {
    pic <- NULL
  }


  mytag <- tags$div(
    class = 'tinyslider-item',
    tags$div(
      class = 'card',
      style = if (!is.null(width)) paste0('width: ', width),
      pic,
      tags$div(
        class = 'content',
        tags$h2(title),
        tags$h3(subtitle),
        tags$p(content),
        button
      )
    )
  )

  return(mytag)

}

#' @rdname tinyslider_cards
#' @importFrom shiny tags
#' @export
tinyslider_card_2 <- function(title = NULL, subtitle = NULL, content = NULL, button_text = NULL, image = NULL, width = NULL) {


  ### button
  if (!is.null(button_text)) {
    button <- tags$div(
      class = 'btn',
      tags$button(button_text)
    )
  } else {
    button <- NULL
  }

  ### image
  if (!is.null(image)) {
    pic <- tags$div(
      class = 'img',
      tags$img(src = image)
    )
  } else {
    pic <- NULL
  }


  mytag <- tags$div(
    class = 'tinyslider-item',
    tags$div(
      class = 'card',
      tags$div(
        class = "card-row",
        tags$div(
          class = "card-column",
          pic
        ),
        tags$div(
          class = "card-column",
          tags$div(
            class = 'content',
            tags$div(class = 'title', title),
            tags$div(class = 'sub-title', subtitle),
            tags$p(content),
            button
          )
        )
      )
    )
  )

  return(mytag)

}

