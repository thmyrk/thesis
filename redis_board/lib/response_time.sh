#!/bin/bash
curl -so response -w '%{time_total}\n' localhost:3000/categories/1
