"""Test python file to see whether envirnoment works"""

import numpy
import scipy
import matplotlib
import seaborn
import jupyterlab
import sklearn
import pandas
import Bio
import logging

logging.info("numpy", numpy.__version__)
logging.info("scipy", scipy.__version__)
logging.info("matplotlib", matplotlib.__version__)
logging.info("seaborn", seaborn.__name__)
logging.info("jupyterlab", jupyterlab.__version__)
logging.info("sklearn", sklearn.__version__)
logging.info("pandas", pandas.__version__)
logging.info("Bio", Bio.__version__)
