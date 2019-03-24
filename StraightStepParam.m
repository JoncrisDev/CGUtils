

function CellImg = StraightStepParam(In_nParts, In_SampleSize)

      % Initial Values and config
      nParts = In_nParts;
      SampleSize = In_SampleSize;

      %nCount = 0;
      InterValOffset = 0;
      IntervalVal = 0;

      % Determine Interval Length and Pad-fill size.
      IntervalLength = round(SampleSize / nParts);
      Remainder = mod(SampleSize, nParts);

      % Loop for the number of parts.
      for nCount = 1:nParts
        IntervalVal = (nCount / nParts);
       
        % Build the Interval
        for j = 1:IntervalLength
          y(InterValOffset + j) = IntervalVal;
        endfor
        
        InterValOffset = InterValOffset + IntervalLength;
        %nCount = nCount + 1;  
        
      endfor

      % Pad Fill Remainder.
      for t = InterValOffset:(SampleSize + Remainder)
        y(t) = IntervalVal;
      endfor

      % Build 2D Array of Samples
      buildSize = size(y);
      for k = 1:SampleSize
        CellImg(k, 1:SampleSize) = y(1:SampleSize);
      endfor

      % Display the Data
      plot(y);
      imshow(CellImg);
end