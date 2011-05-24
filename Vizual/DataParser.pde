
//////////////// DataParser class

class DataParser{
	String rawData [];
	String filename;

	ArrayList coords;
	ArrayList nodes;

	float shiftX = 1316.359;
	float shiftY = 658.179;

	DataParser(String _filename){
		filename = _filename;
		rawData = loadStrings(filename);

		parseVals(rawData);
		castNodes();

	}

	// parse a valuse from given data set
	void parseVals(String data[]){
		ArrayList tmp = new ArrayList();
		for(int i = 0;i<data.length;i+=2){
			tmp.add((String)data[i]);
		}


		coords = new ArrayList(0);

		for(int i = 0; i<tmp.size();i++){
			String cline = (String)tmp.get(i);
			String[] parsed = splitTokens(cline," : ");
			coords.add(new PVector(parseFloat(parsed[0]),parseFloat(parsed[1]),parseFloat(parsed[2])));
		}
	}

	void castNodes(){
		nodes = new ArrayList(0);

		int blockNo = 0;
		for(int sX = 0;sX < 8*shiftX;sX+=shiftX){
			for(int sY = 0;sY < 6*shiftY;sY+=shiftY){
				for(int i = 0;i<coords.size();i++){
					PVector current = (PVector)coords.get(i);
					nodes.add(new Node(i,blockNo,current.x+sX,current.y+sY,current.z));

				}
				blockNo ++;

			}
		}

	}

	ArrayList getNodes(){
		return nodes;
	}
}