context("landscape level shape_sd metric")

fragstats_landscape_landscape_shape_sd <- fragstats_patch_landscape %>%
    summarise(metric = sd(SHAPE)) %>%
    pull(metric) %>%
    round(.,4)
landscapemetrics_landscape_landscape_shape_sd <- lsm_l_shape_sd(landscape)

test_that("lsm_l_shape_sd results are equal to fragstats", {
    expect_true(all(fragstats_landscape_landscape_shape_sd %in%
                        round(landscapemetrics_landscape_landscape_shape_sd$value, 4)))
})

test_that("lsm_l_shape_sd is typestable", {
    expect_is(landscapemetrics_landscape_landscape_shape_sd, "tbl_df")
    expect_is(lsm_l_shape_sd(landscape_stack), "tbl_df")
    expect_is(lsm_l_shape_sd(list(landscape, landscape)), "tbl_df")
})

test_that("lsm_l_shape_sd returns the desired number of columns", {
    expect_equal(ncol(landscapemetrics_landscape_landscape_shape_sd), 6)
})

test_that("lsm_l_shape_sd returns in every column the correct type", {
    expect_type(landscapemetrics_landscape_landscape_shape_sd$layer, "integer")
    expect_type(landscapemetrics_landscape_landscape_shape_sd$level, "character")
    expect_type(landscapemetrics_landscape_landscape_shape_sd$class, "integer")
    expect_type(landscapemetrics_landscape_landscape_shape_sd$id, "integer")
    expect_type(landscapemetrics_landscape_landscape_shape_sd$metric, "character")
    expect_type(landscapemetrics_landscape_landscape_shape_sd$value, "double")
})


