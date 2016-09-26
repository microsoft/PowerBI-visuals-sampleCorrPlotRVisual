if (!exists("settings_method"))
{
    settings_method = "circle";
}

library(corrplot)
M <- cor(Values)
corrplot(M, method=settings_method)