FROM r-base
RUN apt update && apt install -y libglpk-dev libssl-dev libcurl4-openssl-dev pandoc
RUN Rscript -e 'install.packages(c("ROI.plugin.glpk", "rmarkdown", "plotly", "DT", "plyr"), repos=c("https://cloud.r-project.org"))'
RUN Rscript -e 'install.packages("remotes", repos=c("https://cloud.r-project.org"))'
RUN Rscript -e 'remotes::install_github(c("r-opt/rmpk", "r-opt/ROIoptimizer"))'
CMD Rscript -e 'rmarkdown::render("MINT_Summary_version1.Rmd")'
