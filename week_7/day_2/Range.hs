module Range where
    range start step = start:(range (start + step) step)
