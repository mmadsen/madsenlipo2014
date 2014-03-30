orderBalancedTree <- Vectorize(function(r, h) {
  #  computes the number of vertices in a balanced tree of breadth "r" and height "h"
  #
  #  Args:
  #     r:  The breadth (branching factor) of the balanced tree
  #     h:  The height of the balanced tree
  #
  #  Returns:
  #     The number of vertices in a balanced tree
  #
  
  total <- 0
  hseq <- seq.int(0, h)
  total <- sum(r ^ hseq)

  
  return(total)
})






