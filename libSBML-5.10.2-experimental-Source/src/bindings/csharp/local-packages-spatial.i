/**
 * @file:   local-packages-spatial.i
 * @brief:  Implementation of the spatial class
 * @author: SBMLTeam
 *
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2013-2014 jointly by the following organizations:
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 *     3. University of Heidelberg, Heidelberg, Germany
 *
 * Copyright (C) 2009-2013 jointly by the following organizations:
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 *
 * Copyright (C) 2006-2008 by the California Institute of Technology,
 *     Pasadena, CA, USA 
 *
 * Copyright (C) 2002-2005 jointly by the following organizations:
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. Japan Science and Technology Agency, Japan
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 * ------------------------------------------------------------------------ -->
 */
#ifdef USE_SPATIAL
/**
 * Handling array of ints for USE_SPATIAL
 */

 /** For ImageData::setSamples() **/
%include "arrays_csharp.i"
%apply int OUTPUT[] {int* outputSamples};
%apply int OUTPUT[] {int* data};
%apply int INPUT[] {int* samples};
%apply int OUTPUT[] {int* outArray};
%apply int INPUT[] {int* inArray};
%apply double OUTPUT[] {double* outArray};
%apply double INPUT[] {double* inArray};


/** For ImageData::getSamples() **/
%include "typemaps.i"
void ImageData::getSamples(int *outputSamples);
void ImageData::getUncompressed(int *outputSamples);

/*** END handling arrays ***/
%ignore ImageData::getUncompressedData;


/**
 * Adds DownCastBase(long cPtr, boolean owner) method for the groups package extension
 */
%typemap(cscode) SpatialExtension
%{
  public override SBasePlugin DowncastSBasePlugin(IntPtr cPtr, bool owner)
  {
    if (cPtr.Equals(IntPtr.Zero)) return null;

    SBasePlugin sbp = new SBasePlugin(cPtr, false);
    SBase sb = sbp.getParentSBMLObject();

    switch( sb.getTypeCode() )
    {
      case (int) libsbml.SBML_MODEL:
        return new SpatialModelPlugin(cPtr, owner);

      case (int) libsbml.SBML_COMPARTMENT:
        return new SpatialCompartmentPlugin(cPtr, owner);

      case (int) libsbml.SBML_SPECIES:
        return new SpatialSpeciesPlugin(cPtr, owner);

      case (int) libsbml.SBML_PARAMETER:
        return new SpatialParameterPlugin(cPtr, owner);

      case (int) libsbml.SBML_REACTION:
        return new SpatialReactionPlugin(cPtr, owner);

      default:
        return new SBasePlugin(cPtr, owner);
    }
  }

  public override SBase DowncastSBase(IntPtr cPtr, bool owner)
  {
    if (cPtr.Equals(IntPtr.Zero)) return null;

    SBase sb = new SBase(cPtr, false);
    switch( sb.getTypeCode() )
    {
      case (int) libsbml.SBML_LIST_OF:
        string name = sb.getElementName();
        if (name == "listOfDomainTypes")
        {
          return new ListOfDomainTypes(cPtr, owner);
        }
        else if (name == "listOfDomains")
        {
          return new ListOfDomains(cPtr, owner);
        }
        else if (name == "listOfInteriorPoints")
        {
          return new ListOfInteriorPoints(cPtr, owner);
        }
        else if (name == "listOfAdjacentDomains")
        {
          return new ListOfAdjacentDomains(cPtr, owner);
        }
        else if (name == "listOfGeometryDefinitions")
        {
          return new ListOfGeometryDefinitions(cPtr, owner);
        }
        else if (name == "listOfCoordinateComponents")
        {
          return new ListOfCoordinateComponents(cPtr, owner);
        }
        else if (name == "listOfSampledVolumes")
        {
          return new ListOfSampledVolumes(cPtr, owner);
        }
        else if (name == "listOfAnalyticVolumes")
        {
          return new ListOfAnalyticVolumes(cPtr, owner);
        }
        else if (name == "listOfSpatialPoints")
        {
          return new ListOfSpatialPoints(cPtr, owner);
        }
        else if (name == "listOfCSGObjects")
        {
          return new ListOfCSGObjects(cPtr, owner);
        }
        else if (name == "listOfCSGNodes")
        {
          return new ListOfCSGNodes(cPtr, owner);
        }
        else if (name == "listOfCoordinateReferences")
        {
          return new ListOfCoordinateReferences(cPtr, owner);
        }

        return new ListOf(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_DOMAINTYPE:
        return new DomainType(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_DOMAIN:
        return new Domain(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_INTERIORPOINT:
        return new InteriorPoint(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_BOUNDARY:
        return new Boundary(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_ADJACENTDOMAINS:
        return new AdjacentDomains(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_GEOMETRYDEFINITION:
        return new GeometryDefinition(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_COMPARTMENTMAPPING:
        return new CompartmentMapping(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_COORDINATECOMPONENT:
        return new CoordinateComponent(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_SAMPLEDFIELDGEOMETRY:
        return new SampledFieldGeometry(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_SAMPLEDFIELD:
        return new SampledField(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_IMAGEDATA:
        return new ImageData(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_SAMPLEDVOLUME:
        return new SampledVolume(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_ANALYTICGEOMETRY:
        return new AnalyticGeometry(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_ANALYTICVOLUME:
        return new AnalyticVolume(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_PARAMETRICGEOMETRY:
        return new ParametricGeometry(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_PARAMETRICOBJECT:
        return new ParametricObject(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_POLYGONOBJECT:
        return new PolygonObject(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_SPATIALPOINT:
        return new SpatialPoint(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGEOMETRY:
        return new CSGeometry(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGOBJECT:
        return new CSGObject(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGNODE:
        return new CSGNode(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGTRANSFORMATION:
        return new CSGTransformation(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGTRANSLATION:
        return new CSGTranslation(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGROTATION:
        return new CSGRotation(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGSCALE:
        return new CSGScale(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGHOMOGENEOUSTRANSFORMATION:
        return new CSGHomogeneousTransformation(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_TRANSFORMATIONCOMPONENTS:
        return new TransformationComponents(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGPRIMITIVE:
        return new CSGPrimitive(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGPSEUDOPRIMITIVE:
        return new CSGPseudoPrimitive(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_CSGSETOPERATOR:
        return new CSGSetOperator(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_SPATIALSYMBOLREFERENCE:
        return new SpatialSymbolReference(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_DIFFUSIONCOEFFICIENT:
        return new DiffusionCoefficient(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_ADVECTIONCOEFFICIENT:
        return new AdvectionCoefficient(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_BOUNDARYCONDITION:
        return new BoundaryCondition(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_GEOMETRY:
        return new Geometry(cPtr, owner);

      case (int) libsbml.SBML_SPATIAL_COORDINATEREFERENCE:
        return new CoordinateReference(cPtr, owner);

      default:
        return new SBase(cPtr, owner);
    }
  }
%}

//
// Convert GeometryDefinition objects into the most specific object possible.
//
%typemap("csout") GeometryDefinition*
{
  return (GeometryDefinition)libsbml.DowncastSBase($imcall, $owner);
}


//
// Convert GeometryDefinition objects into the most specific object possible.
//
%typemap("csout") CSGNode*
{
  return (CSGNode)libsbml.DowncastSBase($imcall, $owner);
}


//
// Convert GeometryDefinition objects into the most specific object possible.
//
%typemap("csout") CSGTransformation*
{
  return (CSGTransformation)libsbml.DowncastSBase($imcall, $owner);
}



COVARIANT_RTYPE_CLONE(SpatialExtension)
COVARIANT_RTYPE_CLONE(DomainType)
COVARIANT_RTYPE_CLONE(Domain)
COVARIANT_RTYPE_CLONE(InteriorPoint)
COVARIANT_RTYPE_CLONE(Boundary)
COVARIANT_RTYPE_CLONE(AdjacentDomains)
COVARIANT_RTYPE_CLONE(GeometryDefinition)
COVARIANT_RTYPE_CLONE(CompartmentMapping)
COVARIANT_RTYPE_CLONE(CoordinateComponent)
COVARIANT_RTYPE_CLONE(SampledFieldGeometry)
COVARIANT_RTYPE_CLONE(SampledField)
COVARIANT_RTYPE_CLONE(ImageData)
COVARIANT_RTYPE_CLONE(SampledVolume)
COVARIANT_RTYPE_CLONE(AnalyticGeometry)
COVARIANT_RTYPE_CLONE(AnalyticVolume)
COVARIANT_RTYPE_CLONE(ParametricGeometry)
COVARIANT_RTYPE_CLONE(ParametricObject)
COVARIANT_RTYPE_CLONE(PolygonObject)
COVARIANT_RTYPE_CLONE(SpatialPoint)
COVARIANT_RTYPE_CLONE(CSGeometry)
COVARIANT_RTYPE_CLONE(CSGObject)
COVARIANT_RTYPE_CLONE(CSGNode)
COVARIANT_RTYPE_CLONE(CSGTransformation)
COVARIANT_RTYPE_CLONE(CSGTranslation)
COVARIANT_RTYPE_CLONE(CSGRotation)
COVARIANT_RTYPE_CLONE(CSGScale)
COVARIANT_RTYPE_CLONE(CSGHomogeneousTransformation)
COVARIANT_RTYPE_CLONE(TransformationComponents)
COVARIANT_RTYPE_CLONE(CSGPrimitive)
COVARIANT_RTYPE_CLONE(CSGPseudoPrimitive)
COVARIANT_RTYPE_CLONE(CSGSetOperator)
COVARIANT_RTYPE_CLONE(SpatialSymbolReference)
COVARIANT_RTYPE_CLONE(DiffusionCoefficient)
COVARIANT_RTYPE_CLONE(AdvectionCoefficient)
COVARIANT_RTYPE_CLONE(BoundaryCondition)
COVARIANT_RTYPE_CLONE(Geometry)
COVARIANT_RTYPE_CLONE(CoordinateReference)
COVARIANT_RTYPE_CLONE(ListOfDomainTypes)
COVARIANT_RTYPE_CLONE(ListOfDomains)
COVARIANT_RTYPE_CLONE(ListOfInteriorPoints)
COVARIANT_RTYPE_CLONE(ListOfAdjacentDomains)
COVARIANT_RTYPE_CLONE(ListOfGeometryDefinitions)
COVARIANT_RTYPE_CLONE(ListOfCoordinateComponents)
COVARIANT_RTYPE_CLONE(ListOfSampledVolumes)
COVARIANT_RTYPE_CLONE(ListOfAnalyticVolumes)
COVARIANT_RTYPE_CLONE(ListOfSpatialPoints)
COVARIANT_RTYPE_CLONE(ListOfCSGObjects)
COVARIANT_RTYPE_CLONE(ListOfCSGNodes)
COVARIANT_RTYPE_CLONE(ListOfCoordinateReferences)

COVARIANT_RTYPE_LISTOF_GET_REMOVE(DomainType)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(Domain)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(InteriorPoint)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(AdjacentDomains)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(GeometryDefinition)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(CoordinateComponent)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(SampledVolume)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(AnalyticVolume)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(SpatialPoint)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(CSGObject)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(CSGNode)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(CoordinateReference)

SBMLCONSTRUCTOR_EXCEPTION(SpatialPkgNamespaces)
SBMLCONSTRUCTOR_EXCEPTION(DomainType)
SBMLCONSTRUCTOR_EXCEPTION(Domain)
SBMLCONSTRUCTOR_EXCEPTION(InteriorPoint)
SBMLCONSTRUCTOR_EXCEPTION(Boundary)
SBMLCONSTRUCTOR_EXCEPTION(AdjacentDomains)
SBMLCONSTRUCTOR_EXCEPTION(GeometryDefinition)
SBMLCONSTRUCTOR_EXCEPTION(CompartmentMapping)
SBMLCONSTRUCTOR_EXCEPTION(CoordinateComponent)
SBMLCONSTRUCTOR_EXCEPTION(SampledFieldGeometry)
SBMLCONSTRUCTOR_EXCEPTION(SampledField)
SBMLCONSTRUCTOR_EXCEPTION(ImageData)
SBMLCONSTRUCTOR_EXCEPTION(SampledVolume)
SBMLCONSTRUCTOR_EXCEPTION(AnalyticGeometry)
SBMLCONSTRUCTOR_EXCEPTION(AnalyticVolume)
SBMLCONSTRUCTOR_EXCEPTION(ParametricGeometry)
SBMLCONSTRUCTOR_EXCEPTION(ParametricObject)
SBMLCONSTRUCTOR_EXCEPTION(PolygonObject)
SBMLCONSTRUCTOR_EXCEPTION(SpatialPoint)
SBMLCONSTRUCTOR_EXCEPTION(CSGeometry)
SBMLCONSTRUCTOR_EXCEPTION(CSGObject)
SBMLCONSTRUCTOR_EXCEPTION(CSGNode)
SBMLCONSTRUCTOR_EXCEPTION(CSGTransformation)
SBMLCONSTRUCTOR_EXCEPTION(CSGTranslation)
SBMLCONSTRUCTOR_EXCEPTION(CSGRotation)
SBMLCONSTRUCTOR_EXCEPTION(CSGScale)
SBMLCONSTRUCTOR_EXCEPTION(CSGHomogeneousTransformation)
SBMLCONSTRUCTOR_EXCEPTION(TransformationComponents)
SBMLCONSTRUCTOR_EXCEPTION(CSGPrimitive)
SBMLCONSTRUCTOR_EXCEPTION(CSGPseudoPrimitive)
SBMLCONSTRUCTOR_EXCEPTION(CSGSetOperator)
SBMLCONSTRUCTOR_EXCEPTION(SpatialSymbolReference)
SBMLCONSTRUCTOR_EXCEPTION(DiffusionCoefficient)
SBMLCONSTRUCTOR_EXCEPTION(AdvectionCoefficient)
SBMLCONSTRUCTOR_EXCEPTION(BoundaryCondition)
SBMLCONSTRUCTOR_EXCEPTION(Geometry)
SBMLCONSTRUCTOR_EXCEPTION(CoordinateReference)
SBMLCONSTRUCTOR_EXCEPTION(ListOfDomainTypes)
SBMLCONSTRUCTOR_EXCEPTION(ListOfDomains)
SBMLCONSTRUCTOR_EXCEPTION(ListOfInteriorPoints)
SBMLCONSTRUCTOR_EXCEPTION(ListOfAdjacentDomains)
SBMLCONSTRUCTOR_EXCEPTION(ListOfGeometryDefinitions)
SBMLCONSTRUCTOR_EXCEPTION(ListOfCoordinateComponents)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSampledVolumes)
SBMLCONSTRUCTOR_EXCEPTION(ListOfAnalyticVolumes)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpatialPoints)
SBMLCONSTRUCTOR_EXCEPTION(ListOfCSGObjects)
SBMLCONSTRUCTOR_EXCEPTION(ListOfCSGNodes)
SBMLCONSTRUCTOR_EXCEPTION(ListOfCoordinateReferences)

#endif /* USE_SPATIAL */

