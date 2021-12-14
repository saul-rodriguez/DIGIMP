amsSetAnalysisView min {func test}
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
amsWriteSDF4View {func_min test_min}

amsSetAnalysisView max {func test}
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
amsWriteSDF4View {func_max test_max}

amsSetAnalysisView typ {func test}
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
amsWriteSDF4View {func_typ test_typ}


